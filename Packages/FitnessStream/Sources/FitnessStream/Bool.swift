//
// Bool.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public extension Bool {
  static func mapTo(_ closure: @escaping (Error?) -> Void) -> (Bool, Error?) -> Void { {
    result, passed in
    let error: Error?
    if let passed = passed {
      error = passed
    } else if result {
      error = nil
    } else {
      error = EmptyError()
    }
    closure(error)
  }
  }
}
