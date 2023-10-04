//
// WorkoutFactoryProtocol.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//


public protocol WorkoutFactoryProtocol {
  func startWorkout(basedOn dependencies: WorkoutDependencies, using delegate: WorkoutDelegate) throws -> any WorkoutStream
}
