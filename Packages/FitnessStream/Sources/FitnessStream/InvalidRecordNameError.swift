//
// InvalidRecordNameError.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public struct InvalidRecordNameError: Error {
  public let string: String
  public init(string: String) {
    self.string = string
  }
}
