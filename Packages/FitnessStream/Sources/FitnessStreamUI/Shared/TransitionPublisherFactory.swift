//
// TransitionPublisherFactory.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine)
  import Combine
  import Foundation
import FitnessStream

  public struct TransitionPublisherFactory: TransitionPublicist {
    public init() {}
    public func publisher<WorkoutPublisher: Publisher, ActivePublisher: Publisher, WorkoutType>(
      basedOn workout: WorkoutPublisher,
      when isWorkoutActive: ActivePublisher
    ) -> AnyPublisher<WorkoutBusyState?, Never>
      where ActivePublisher.Output == Bool,
      WorkoutPublisher.Output == WorkoutType?,
      ActivePublisher.Failure == Never,
      WorkoutPublisher.Failure == Never {
      let existsPublisher = workout.map { $0 != nil }
      return isWorkoutActive.combineLatest(existsPublisher) { active, workout -> WorkoutBusyState? in
        switch (active, workout) {
        case (false, true):
          return .ending
        case (true, false):
          return .starting
        default:
          return nil
        }
      }.eraseToAnyPublisher()
    }
  }
#endif
