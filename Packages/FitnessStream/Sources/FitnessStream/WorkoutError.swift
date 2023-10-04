//
// WorkoutError.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public struct WorkoutError: Error {
  public init(source: Any? = nil, innerError: Error, duringEvent: WorkoutError.Event) {
    self.source = source
    self.innerError = innerError
    self.duringEvent = duringEvent
  }
  
  public enum Event {
    case session
    case beginning
    case ending
  }

  public let source: Any?
  public let innerError: Error
  public let duringEvent: Event
}
