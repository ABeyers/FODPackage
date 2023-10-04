//
// JSONDecoder.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public extension JSONDecoder {
  static var `default`: JSONDecoder {
    Encoding.jsonDecoder
  }

  convenience init(dateDecodingStrategy: JSONDecoder.DateDecodingStrategy) {
    self.init()
    self.dateDecodingStrategy = dateDecodingStrategy
  }
}
