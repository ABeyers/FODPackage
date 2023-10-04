//
// WorkoutFactory.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public struct WorkoutFactory: WorkoutFactoryProtocol {
  public init () {}
  public func startWorkout(basedOn dependencies: WorkoutDependencies, using delegate: WorkoutDelegate) throws -> any WorkoutStream {
    let (healthInterface, activityType) = dependencies

    var workout: any WorkoutStream
    workout = try healthInterface.workout(withConfiguration: WorkoutConfiguration(activityType: activityType))
    workout.delegate = delegate
    workout.start()
    return workout
  }
}
