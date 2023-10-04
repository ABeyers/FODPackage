//
// WorkoutStatusQuery.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
import SundialKit
extension UUID {
  init?(possibleString: Any?) {
    guard let uuidString = (possibleString as? String) else {
      return nil
    }
    self.init(uuidString: uuidString)
  }
}

public struct WorkoutStatusQuery : Messagable {
  public init(requestedDate: Date = .init(), id: UUID = .init()) {
    self.requestedDate = requestedDate
    self.id = id
  }

  let requestedDate: Date
  let id: UUID
  public static let key: String = "workoutStatusQuery"

  public init?(from parameters: [String: Any]?) {
    guard let parameters = parameters else {
      return nil
    }

    guard let requestedDate = parameters["requestedDate"] as? Date else {
      return nil
    }

    guard let id = UUID(possibleString: parameters["id"]) else {
      return nil
    }

    self.init(requestedDate: requestedDate, id: id)
  }

  public func parameters() -> [String: Any] {
    [
      "requestedDate": requestedDate,
      "id": id.uuidString
    ]
  }
}
