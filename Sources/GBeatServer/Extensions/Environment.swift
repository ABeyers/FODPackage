//
// Environment.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FitnessStream

import Vapor

extension Environment {
  var successURL: URI {
    URI(string: "http://")
  }

  static func requires(_ key: String) throws -> String {
    guard let value = get(key) else {
      throw InternalError.missingEnvironmentVariable(key)
    }
    return value
  }
}
