//
// WorkoutTypeMigration.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FitnessStream
import Fluent
import FluentPostgresDriver
import Vapor

struct WorkoutTypeMigration: Migration {
  fileprivate func createTable(on database: Database) -> EventLoopFuture<Void> {
    database.schema(WorkoutType.schema)
      .field(.id, .uint, .identifier(auto: false))
      .field("description", .string, .required)
      .field("isPopular", .bool, .required)
      .field("createdAt", .datetime)
      .field("updatedAt", .datetime)
      .field("deletedAt", .datetime)
      .create()
  }

  fileprivate func importActivityTypes(on database: Database) -> EventLoopFuture<Void> {
    ActivityType.gBeatActivities
      .map(WorkoutType.init)
      .map { $0.save(on: database) }
      .flatten(on: database.eventLoop)
  }

  fileprivate func buildWorkoutTypeTable(on database: Database) -> EventLoopFuture<Void> {
    createTable(on: database).flatMap {
      importActivityTypes(on: database)
    }
  }

  func prepare(on database: Database) -> EventLoopFuture<Void> {
    database.transaction(buildWorkoutTypeTable(on:))
  }

  func revert(on database: Database) -> EventLoopFuture<Void> {
    database.schema(WorkoutType.schema).delete()
  }
}
