//
// WorkoutChangeFactoryProtocol.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

@available(watchOS 7.0, iOS 14.0, *)
public protocol WorkoutChangeFactoryProtocol {
  func changeStart(_ source: WorkoutChangeSource) -> Void?
  func changeEnd(_ source: WorkoutChangeSource) -> (any WorkoutStream)?
}
