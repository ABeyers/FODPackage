//
// EmailPerson.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public struct EmailPerson: Codable, CustomStringConvertible {
  public let email: String
  public let name: String?

  public init(email: String, name: String? = nil) {
    self.email = email
    self.name = name
  }

  public var description: String {
    if let name = name {
      return "\(name) <\(email)>"
    } else {
      return email
    }
  }
}
