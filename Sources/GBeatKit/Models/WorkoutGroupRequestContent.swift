//
// WorkoutGroupRequestContent.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
import PrchModel

public struct WorkoutGroupRequestContent: Codable, Content {
  public init(workoutTypeID: Int, userID: Int, facilityID: Int, firstName: String, dateOfBirth: Date) {
    self.workoutTypeID = workoutTypeID
    self.userID = userID
    self.facilityID = facilityID
    self.firstName = firstName
    self.dateOfBirth = dateOfBirth
  }

  public let workoutTypeID: Int
  public let userID: Int
  public let facilityID: Int
  public let firstName: String
  public let dateOfBirth: Date
}
