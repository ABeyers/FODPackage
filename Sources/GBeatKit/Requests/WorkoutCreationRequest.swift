//
// WorkoutCreationRequest.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
import PrchModel

public struct WorkoutCreationRequest: ServiceCall {
  public init(body: WorkoutGroupRequestContent) {
    self.body = body
  }

  public let body: WorkoutGroupRequestContent

  public typealias BodyType = WorkoutGroupRequestContent

  public typealias SuccessType = WorkoutGroupCreateResponseContent

  public var path: String {
    "/workouts"
  }

  public var parameters: [String: String] {
    [:]
  }

  public var method: PrchModel.RequestMethod {
    .POST
  }

  public typealias ServiceAPI = FitnessOnDemandAPI
}
