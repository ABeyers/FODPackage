//
// IndexServingMiddleware.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
import Vapor

struct IndexServingMiddleware: Middleware {
  let apiPaths: [String]

  internal init(apiPaths: [String], publicDirectory: String) throws {
    self.apiPaths = apiPaths
    let filePath = publicDirectory + "/index.html"
    let fileURL = URL(fileURLWithPath: filePath)
    let modifiedAt: Date?

    let attributes = try FileManager.default.attributesOfItem(atPath: filePath)
    modifiedAt = attributes[.modificationDate] as? Date
    let data = try Data(contentsOf: fileURL)
    let fileSize = (attributes[.size] as? NSNumber)?.intValue

    var headers: HTTPHeaders = [:]
    headers.contentType = .html
    // Generate ETag value, "HEX value of last modified date" + "-" + "file size"

    if let modifiedAt, let fileSize {
      let fileETag = "\(modifiedAt.timeIntervalSince1970)-\(fileSize)"
      headers.replaceOrAdd(name: .eTag, value: fileETag)
    } else {
      Logger(label: "setup").warning("missing modified and fileSize")
    }
    indexHeaders = headers
    indexData = data
  }

  private var indexResponse: Response {
    Response(status: .ok, headers: indexHeaders, body: .init(data: indexData))
  }

  private let indexData: Data
  private let indexHeaders: HTTPHeaders

  func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Vapor.Response> {
    if apiPaths.contains(where: request.url.path.hasPrefix(_:)) {
      return next.respond(to: request)
    }
    return request.eventLoop.makeSucceededFuture(indexResponse)
  }
}
