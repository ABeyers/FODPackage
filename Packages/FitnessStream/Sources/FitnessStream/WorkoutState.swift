//
// WorkoutState.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public enum WorkoutState: Int {
  case none = 0
  case notStarted = 1
  case running
  case ended
  case paused
  case prepared
  case stopped
}
