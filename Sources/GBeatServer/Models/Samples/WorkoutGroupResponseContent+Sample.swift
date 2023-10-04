//
// WorkoutGroupResponseContent+Sample.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FitnessStream
import Foundation
import GBeatKit

import OpenAPIReflection
import Sampleable
import Vapor
import VaporOpenAPI

extension WorkoutGroupResponseContent: Content, Sampleable, OpenAPIExampleProvider {
  public static var sample: WorkoutGroupResponseContent {
    WorkoutGroupResponseContent(
      id: .init()
    )
  }

  public static func openAPISchema(using encoder: JSONEncoder) throws -> JSONSchema {
    try genericOpenAPISchemaGuess(using: encoder)
  }
}
