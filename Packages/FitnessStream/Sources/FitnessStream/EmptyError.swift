//
// EmptyError.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
public struct EmptyError: Error {
  let details: String?
  public init(details: String? = nil) {
    self.details = details
  }
}
