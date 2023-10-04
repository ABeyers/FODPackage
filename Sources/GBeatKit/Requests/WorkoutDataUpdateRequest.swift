//
// WorkoutDataUpdateRequest.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FitnessStream
import Foundation
import PrchModel

public enum SocketStatus: ContentDecodable {
  public static let decodable = SocketStatus.self

  public init(decoded: SocketStatus) throws {
    self = decoded
  }

  public static func decode<CoderType>(_: CoderType.DataType, code: Int, using _: CoderType) throws -> SocketStatus where CoderType: PrchModel.Decoder {
    code == 202 ? .active : .inactive
  }

  public typealias DecodableType = Self

  case active
  case inactive
}

public struct WorkoutDataUpdateRequest: ServiceCall {
  public init(tuple: (UUID, WorkoutData)) {
    self.init(workoutID: tuple.0, body: tuple.1)
  }

  public init(workoutID: UUID, body: WorkoutData) {
    self.workoutID = workoutID
    self.body = body
  }

  public typealias SuccessType = SocketStatus
  public let workoutID: UUID
  public var body: WorkoutData

  public var path: String {
    "/workouts/\(workoutID)"
  }

  public var method: PrchModel.RequestMethod {
    .PUT
  }

  public static var requiresCredentials: Bool {
    false
  }

  public typealias ServiceAPI = FitnessOnDemandAPI
}
