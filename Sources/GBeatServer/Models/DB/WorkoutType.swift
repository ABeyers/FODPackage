//
// WorkoutType.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FitnessStream
import FluentPostgresDriver
import Vapor

final class WorkoutType: Model {
  static let schema = "WorkoutType"

  init() {}

  @ID(custom: .id, generatedBy: .user)
  var id: Int?

  @Field(key: "description")
  var description: String

  @Field(key: "isPopular")
  var isPopular: Bool

  @Timestamp(key: "createdAt", on: .create)
  var createdAt: Date?

  @Timestamp(key: "updatedAt", on: .update)
  var updatedAt: Date?

  @Timestamp(key: "deletedAt", on: .delete)
  var deletedAt: Date?

  init(id: Int, description: String, isPopular: Bool = false) {
    self.id = id
    self.description = description
    self.isPopular = isPopular
  }
}

extension WorkoutType {
  convenience init(activityType: ActivityType) {
    self.init(id: activityType.id.rawValue, description: activityType.description, isPopular: activityType.isPopular)
  }
}

extension WorkoutType: ActivityTypeComponents {
  var rawValue: ActivityTypeId.RawValue? {
    id
  }
}
