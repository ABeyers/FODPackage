//
// JSONEncoder.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public extension JSONEncoder {
  static var `default`: JSONEncoder {
    Encoding.jsonEncoder
  }

  convenience init(dateEncodingStrategy: JSONEncoder.DateEncodingStrategy) {
    self.init()
    self.dateEncodingStrategy = dateEncodingStrategy
  }
}
