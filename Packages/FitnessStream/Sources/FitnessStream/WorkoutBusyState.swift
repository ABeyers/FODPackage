//
// WorkoutBusyState.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public enum TransitionState {
  case starting
  case ending
}

public typealias WorkoutBusyState = TransitionState

extension WorkoutBusyState: CustomStringConvertible {
  public var description: String {
    switch self {
    case .starting:
      return "Starting Workout..."
    case .ending:
      return "Ending Workout..."
    }
  }
}
