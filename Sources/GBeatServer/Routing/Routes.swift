//
// Routes.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FelinePine
import GBeatKit
import RouteGroups
import Vapor

struct Routes: GroupCollection {
  func boot(groups: RouteGroups.GroupBuilder<RouteGroupKey>) throws {
    try groups.register(collection: APIDocsController(app: app))
    try groups.register(collection: WorkoutGroupController())
  }

  func groupBuilder(routes: Vapor.RoutesBuilder) -> RouteGroups.GroupBuilder<RouteGroupKey> {
    let api = routes.grouped("api", "v1")

    return .init(groups: [.publicAPI: api])
  }

  typealias RouteGroupKeyType = RouteGroupKey

  let app: Application
}
