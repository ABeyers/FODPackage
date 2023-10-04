//
// WorkoutTypeController+Docs.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FitnessStream
import Foundation
import GBeatKit
import RouteGroups

import Vapor
import VaporOpenAPI

extension WorkoutTypeController {
  struct ListWorkoutTypesContext: RouteContext {
    typealias RequestBodyType = EmptyRequestBody
    typealias ResponseBodyType = [ActivityType]

    static let defaultContentType: HTTPMediaType? = .json
    static let shared = ListWorkoutTypesContext()

    let success: ResponseContext<ResponseBodyType> = .init { response in
      response.status = .ok
      response.headers.contentType = .json
      _ = try? response.content.encode([
        ActivityType(fromComponents: WorkoutType(activityType: .barre))!
      ])
    }
  }
}
