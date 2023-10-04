//
// MetadataPublicist.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine)
  import Combine
  import Foundation
import FitnessStream
import FitnessStream

  public protocol MetadataPublicist {
    func publisher<FullIdentifierPublisher: Publisher, WorkoutPublisher: Publisher, IdentifierType>(
      withId idPublisher: FullIdentifierPublisher,
      forWorkout workoutPublisher: WorkoutPublisher
    ) -> AnyPublisher<Error?, Never> where
      FullIdentifierPublisher.Output == IdentifierType?,
      FullIdentifierPublisher.Failure == Never,
      WorkoutPublisher.Output == WorkoutStream?,
      WorkoutPublisher.Failure == Never
  }
#endif
