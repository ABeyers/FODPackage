//
// WorkoutChangeFactory.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
public struct WorkoutChangeFactory: WorkoutChangeFactoryProtocol {
  public init () {}
  public func changeStart(_ source: WorkoutChangeSource) -> Void? {
    (source.0 && source.1 == nil) ? () : nil
  }

  public func changeEnd(_ source: WorkoutChangeSource) -> (any WorkoutStream)? {
    guard source.0 == false else {
      return nil
    }
    return source.1
  }
}
