//
// ConnectionStatus.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public enum WorkoutConnectionStatus {
  case inactive
  case preparing
  case waiting
  case active
  case failure(Error)

  public init(started: Bool, isListened: Bool?, activityError: Error?) {
    switch (started, isListened, activityError) {
    case (false, _, _):
      self = .inactive
    case (true, .none, .none):
      // workout hasn't started
      self = .preparing
    case (true, _, let .some(error)):
      // error
      self = .failure(error)
    case (true, .some(true), .none):
      self = .active
    // class has started
    case (true, .some(false), .none):
      self = .waiting
      // class hasn't started
    }
  }
}
