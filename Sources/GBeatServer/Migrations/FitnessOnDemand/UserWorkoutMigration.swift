//
// UserWorkoutMigration.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Fluent
import FluentPostgresDriver
import GBeatKit
import Vapor

struct UserWorkoutMigration: Migration {
  func prepare(on database: Database) -> EventLoopFuture<Void> {
    database.schema(UserWorkoutModel.schema)
      .id()
      .field("userID", .int, .required)
      .field("facilityID", .int, .required)
      .field("workoutTypeID", .int, .required, .foreignKey(WorkoutType.schema, .key(.id), onDelete: .noAction, onUpdate: .noAction))
      .field("createdAt", .datetime)
      .field("updatedAt", .datetime).create()
  }

  func revert(on database: Database) -> EventLoopFuture<Void> {
    database.schema(UserWorkoutModel.schema).delete()
  }
}
