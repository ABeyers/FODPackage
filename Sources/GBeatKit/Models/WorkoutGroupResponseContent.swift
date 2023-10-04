//
// WorkoutGroupResponseContent.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FelinePine
import FitnessStream
import Foundation
import PrchModel

public struct WorkoutGroupResponseContent: Codable, LoggerCategorized, Content {
  public init(id: UUID) {
    self.id = id
  }

  public static var loggingCategory: FitnessStream.LoggerCategory {
    .ui
  }

  public typealias LoggersType = HeartwitchLoggers

  public let id: UUID
}

public typealias WorkoutGroupCreateResponseContent = WorkoutGroupResponseContent
public typealias WorkoutGroupCreateRequestContent = WorkoutGroupRequestContent
