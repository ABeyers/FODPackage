//
// StartWorkoutMessage.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import SundialKit

public struct StartWorkoutMessage<IdentifierType>: Messagable {
  public init(workoutID: IdentifierType) {
    self.workoutID = workoutID
  }

  public init?(from parameters: [String: Any]?) {
    guard let workoutID = parameters?["id"] as? IdentifierType else {
      return nil
    }
    self.init(workoutID: workoutID)
  }

  public static var key: String {
    "startWorkout"
  }
  public let workoutID: IdentifierType

  public func parameters() -> [String: Any] {
    ["id": workoutID]
  }
}
