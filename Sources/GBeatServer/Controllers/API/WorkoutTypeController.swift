//
// WorkoutTypeController.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FitnessStream
import FluentPostgresDriver
import RouteGroups
import Vapor
import VaporOpenAPI

struct WorkoutTypeController {
  func get(_ req: TypedRequest<ListWorkoutTypesContext>) async throws -> [ActivityType] {
    try await WorkoutType.query(on: req.db)
      .sort(\.$isPopular, .descending)
      .sort(\.$description)
      .all()
      .compactMap(ActivityType.init(fromComponents:))
  }
}

extension WorkoutTypeController: RouteGroupCollection {
  var routeGroups: [RouteGroupKey: RouteCollectionBuilder] {
    var routeGroups = [RouteGroupKey: RouteCollectionBuilder]()
    routeGroups[.publicAPI] = { routes in
      routes.get("workout-types", use: self.get)
        .description("Get a list of all available workout types.")
        .tags("Workout Types", "Public")
    }
    return routeGroups
  }
}
