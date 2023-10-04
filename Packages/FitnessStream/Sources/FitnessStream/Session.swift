//
// Session.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
import FelinePine

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol Session {
  associatedtype RequestType: SessionRequest
  associatedtype ResponseType: Response
  func request(withURL url: URL) -> RequestType
  @discardableResult
  func begin(request: RequestType, _ completionHandler: @escaping (Data?, ResponseType?, Error?) -> Void) -> SessionTask
  func begin(request: RequestType) async throws -> (Data, ResponseType)
}
extension Result {
  init(success: Success?, failure: Failure?) where Failure == Error {
    if let failure = failure {
      self = .failure(failure)
    } else if let success = success {
      self = .success(success)
    } else {
      self = .failure(EmptyError())
    }
  }

  struct EmptyError: Error {}
}

extension Optional {
  func flatTuple<OtherType>(_ other: OtherType?) -> (Wrapped, OtherType)? {
    flatMap { wrapped in
      other.map { (wrapped, $0) }
    }
  }
}

extension URLSession: Session, LoggerCategorized {

    func dataAsync(for request: URLRequest) async throws -> (Data, URLResponse) {
      #if !canImport(FoundationNetworking)
        if #available(iOS 15, macOS 12, tvOS 15, watchOS 8, *) {
          return try await self.data(for: request)
        }
      #endif

      return try await withCheckedThrowingContinuation { continuation in
        let task = self.dataTask(with: request) { data, response, error in
          continuation.resume(with: .init(success: data.flatTuple(response), failure: error))
        }
        task.resume()
      }
    }
  public func begin(request: URLRequest) async throws -> (Data, URLResponse) {
    return try await self.dataAsync(for: request)
  }
  
  public static var loggingCategory: LoggerCategory {
    return .networking
  }
  
  public typealias LoggersType = HeartwitchLoggers

  public typealias RequestType = URLRequest
  public typealias ResponseType = URLResponse
  public func request(withURL url: URL) -> URLRequest {
    Self.logger.debug("making URLRequest to \(url)")
    return URLRequest(url: url)
  }

  public func begin(request: URLRequest, _ completionHandler: @escaping (Data?, ResponseType?, Error?) -> Void) -> SessionTask {
    let task = dataTask(with: request) { data, response, error in
      if let error {
        Self.logger.debug("error URLRequest of \(request.url?.description ?? ""): \(error.localizedDescription)")
      } else if let data, let response = response as? HTTPURLResponse {
        Self.logger.debug("response URLRequest of \(request.url?.description ?? "") \(response.statusCode) : \(data.base64EncodedString())")
      } else {
        Self.logger.debug("invalid URLRequest of \(request.url?.description ?? ""): \(String.dumping(response))")
      }
      completionHandler(data, response, error)
    }
    task.resume()
    return task
  }
}
