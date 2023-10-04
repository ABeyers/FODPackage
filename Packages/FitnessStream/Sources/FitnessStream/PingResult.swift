//
// PingResult.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public enum PingResult {
  case requestFailure(Error)
  case clientFailure(Error)
  case serverFailure(String?)
  case unknownResponse
  case unknownStatusCode(Int)
  case unauthorized
  case success

  public init(_ data: Data?, _ response: Response?, _ error: Error?) {
    switch (response?.httpStatusCode, error) {
    case let (_, .some(error)):
      self = .clientFailure(error)
    case (.some(200 ..< 300), .none):
      self = .success
    case (.some(400 ..< 500), .none):
      self = .unauthorized
    case (.some(500 ..< 600), .none):
      self = .serverFailure(data.flatMap { String(data: $0, encoding: .utf8) })
    case let (.some(code), .none):
      self = .unknownStatusCode(code)
    case (.none, .none):
      self = .unknownResponse
    }
  }
}
