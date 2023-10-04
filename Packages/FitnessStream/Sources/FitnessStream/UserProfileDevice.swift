//
// UserProfileDevice.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public struct UserProfileDevice: Codable {
  public init(identifier: UUID, name: String, isRegistered: Bool) {
    self.identifier = identifier
    self.name = name
    self.isRegistered = isRegistered
  }

  public let identifier: UUID
  public let name: String
  public let isRegistered: Bool
}
