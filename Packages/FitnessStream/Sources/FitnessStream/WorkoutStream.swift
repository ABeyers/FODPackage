//
// WorkoutStream.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public protocol WorkoutStream {
  var delegate: WorkoutDelegate? { get set }
  var startDate: Date? { get }
  func start()
  func end()
  func setFullIdentifier(_ fullIdentifier: Any, _ completion: @escaping (Error?) -> Void)
}
