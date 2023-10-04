//
// WorkoutStatusMessage.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
import FitnessStream
import SundialKit

public struct WorkoutStatusMessage : Messagable {
  public init(status: WorkoutState, requestedID: UUID?) {
    state = status
    self.requestedID = requestedID
  }

  public init(status: WorkoutState) {
    self.init(status: status, requestedID: nil)
  }

  public static let key: String = "workoutStatus"
  public let state: WorkoutState
  public let requestedID: UUID?

  public init?(from parameters: [String: Any]?) {
    guard let parameters = parameters else {
      return nil
    }

    guard let rawValue = parameters["state"] as? Int else {
      return nil
    }

    guard let status = WorkoutState(rawValue: rawValue) else {
      return nil
    }

    let requestedID = UUID(possibleString: parameters["requestedID"])

    self.init(status: status, requestedID: requestedID)
  }

  public func parameters() -> [String: Any] {
    var params: [String: Any] = ["state": state.rawValue]
    if let requestedID = requestedID {
      params["requestedID"] = requestedID.uuidString
    }
    return params
  }
}
