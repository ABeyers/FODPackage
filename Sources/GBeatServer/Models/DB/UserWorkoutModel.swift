//
// UserWorkoutModel.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Fluent
import Foundation
import GBeatKit
import Vapor

final class UserWorkoutModel: Model {
  internal init(id: UUID? = nil, facilityID: Int, userID: Int, workoutTypeID: WorkoutType.IDValue, createdAt: Date? = nil, updatedAt: Date? = nil) {
    self.id = id
    self.facilityID = facilityID
    self.userID = userID
    $workoutType.id = workoutTypeID
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }

  static let schema = "UserWorkout"

  init() {}

  @ID(key: .id)
  var id: UUID?

  @Field(key: "facilityID")
  var facilityID: Int

  @Field(key: "userID")
  var userID: Int

  @Parent(key: "workoutTypeID")
  var workoutType: WorkoutType

  @Timestamp(key: "createdAt", on: .create)
  var createdAt: Date?

  @Timestamp(key: "updatedAt", on: .update)
  var updatedAt: Date?
}

extension UserWorkoutModel {
  static func create(on db: Database, content: WorkoutGroupRequestContent) async throws -> UserWorkoutModel {
    let model = UserWorkoutModel(facilityID: content.facilityID, userID: content.userID, workoutTypeID: content.workoutTypeID)
    try await model.save(on: db)
    return model
  }
}
