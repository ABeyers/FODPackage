//
// WorkoutUpdateError.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public enum WorkoutUpdateError: Error {
  case expired
  case invalid
  case unknown

  public init(httpStatusCode: Int?) {
    guard let httpStatusCode else {
      self = .invalid
      return
    }
    switch httpStatusCode {
    case 410: self = .expired
    default: self = .unknown
    }
  }
}
