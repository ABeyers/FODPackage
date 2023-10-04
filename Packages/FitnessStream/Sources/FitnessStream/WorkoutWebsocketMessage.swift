//
// WorkoutWebsocketMessage.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public struct WorkoutWebsocketMessage<UserID : Codable>: Codable {
  public let heartRate: Double?
  public let activeEnergyBurned: Double?
  public let userId: UserID
  public let displayName: String
  public let dateOfBirth: Date?

  public init(heartRate: Double?, activeEnergyBurned: Double?, userId: UserID, displayName: String, dateOfBirth: Date?) {
    self.heartRate = heartRate
    self.activeEnergyBurned = activeEnergyBurned
    self.userId = userId
    self.displayName = displayName
    self.dateOfBirth = dateOfBirth
  }
}
