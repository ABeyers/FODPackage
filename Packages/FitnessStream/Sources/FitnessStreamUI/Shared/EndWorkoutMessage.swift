//
// EndWorkoutMessage.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
import SundialKit

public struct EndWorkoutMessage: Messagable {
  let requestedDate: Date
  public init(requestedDate: Date = .init()) {
    self.requestedDate = requestedDate
  }

  public init?(from parameters: [String: Any]?) {
    guard let requestedDate = parameters?["requestedDate"] as? Date else {
      return nil
    }
    self.init(requestedDate: requestedDate)
  }

  public static let key = "endWorkout"

  public func parameters() -> [String: Any] {
    ["requestedDate": requestedDate]
  }
}
