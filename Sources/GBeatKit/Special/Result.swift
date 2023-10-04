//
// Result.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public extension Result {
  init(_ success: Success?, _ error: Failure?, _ fallbackError: Failure) {
    if let error {
      self = .failure(error)
    } else if let success {
      self = .success(success)
    } else {
      self = .failure(fallbackError)
    }
  }
}
