//
// TransitionPublicist.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine)
  import Combine
  import Foundation
import FitnessStream

  public protocol TransitionPublicist {
    func publisher<InputPublisher: Publisher, BooleanPublisher: Publisher, Input>(
      basedOn workout: InputPublisher,
      when isWorkoutActive: BooleanPublisher
    ) -> AnyPublisher<TransitionState?, Never> where
      BooleanPublisher.Output == Bool,
      InputPublisher.Output == Input?,
      BooleanPublisher.Failure == Never,
      InputPublisher.Failure == Never
  }
#endif
