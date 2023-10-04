//
// WorkoutGroupController+Docs.swift
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

extension WorkoutGroupController {
  struct PushWorkoutDataContext: RouteContext {
    typealias RequestBodyType = WorkoutData
    typealias ResponseBodyType = EmptyResponseBody

    static let defaultContentType: HTTPMediaType? = .json
    static let shared = PushWorkoutDataContext()

    let success: ResponseContext<ResponseBodyType> = .init { response in
      response.status = .accepted
    }
  }

  struct CreateWorkoutGroupContext: RouteContext {
    typealias RequestBodyType = WorkoutGroupCreateRequestContent
    typealias ResponseBodyType = WorkoutGroupCreateResponseContent

    static let defaultContentType: HTTPMediaType? = .json
    static let shared = CreateWorkoutGroupContext()

    let success: ResponseContext<ResponseBodyType> = .init { response in
      response.status = .created
      response.headers.contentType = .json
      _ = try? response.content.encode(ResponseBodyType.sample)
    }
  }

  struct ObserveWorkoutGroupContext: RouteContext {
    typealias RequestBodyType = EmptyRequestBody
    typealias ResponseBodyType = EmptyResponseBody

    static let defaultContentType: HTTPMediaType? = .json
    static let shared = ObserveWorkoutGroupContext()

    static let requestQueryParams: [AbstractQueryParam] = [
      token
    ]

    static let token = StringQueryParam(
      name: "facilityID",
      description: "The ID of the facility to post to.",
      required: true
    )

    var token: StringQueryParam { Self.token }

    let success: ResponseContext<ResponseBodyType> = .init { response in
      response.status = .ok
    }
  }
}
