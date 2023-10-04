//
// Result.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public extension Result {
  init(_ success: Success?, _ error: Failure?, _ fallbackError: Failure) {
    if let error = error {
      self = .failure(error)
    } else if let success = success {
      self = .success(success)
    } else {
      self = .failure(fallbackError)
    }
  }

  init(_ success: Success, _ error: Failure?) {
    if let error = error {
      self = .failure(error)
    } else {
      self = .success(success)
    }
  }
}
