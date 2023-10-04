//
// Device.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public struct Device: Codable {
  public init(id: UUID, model: String, operatingSystem: String, topic: String) {
    self.id = id
    self.model = model
    self.operatingSystem = operatingSystem
    self.topic = topic
  }

  public let id: UUID
  public let model: String
  public let operatingSystem: String
  public let topic: String
}
