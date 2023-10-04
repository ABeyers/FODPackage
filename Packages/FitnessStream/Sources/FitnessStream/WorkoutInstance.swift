//
// WorkoutInstance.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public struct WorkoutInstance: Codable {
  public init(createdAt: Date, updatedAt: Date) {
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }

  public let createdAt: Date
  public let updatedAt: Date
}
