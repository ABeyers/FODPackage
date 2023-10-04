//
// UserProfile.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public struct HWUserProfile: Codable {
  public init(id: UUID, emailAddress: String, plan: HWUserPlan, isNew: Bool, sourceURL: URL?, readyWorkoutID: String?, activeWorkoutID: String?, workouts: [UserProfileWorkout], devices: [UserProfileDevice]) {
    self.id = id
    self.emailAddress = emailAddress
    self.plan = plan
    self.isNew = isNew
    self.sourceURL = sourceURL
    self.readyWorkoutID = readyWorkoutID
    self.activeWorkoutID = activeWorkoutID
    self.workouts = workouts
    self.devices = devices
  }

  public let id: UUID
  public let emailAddress: String
  public let plan: HWUserPlan
  public let isNew: Bool

  public let sourceURL: URL?
  public let readyWorkoutID: String?
  public let activeWorkoutID: String?

  public let workouts: [UserProfileWorkout]
  public let devices: [UserProfileDevice]?
}
