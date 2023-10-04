//
// WorkoutStartPublicist.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine)
  import Combine
  import Foundation
import FitnessStream
  @available(*, deprecated)
  public protocol HWWorkoutStartPublicist {
    typealias WorkoutParameterType = ActivityTypeId.RawValue
    func publisher<HealthInterfacePublisher: Publisher, ActivityTypePublisher: Publisher>(
      basedOn healthInterfaceResult: HealthInterfacePublisher,
      withActivtyTypePublisher activityTypeIdValue: ActivityTypePublisher
    ) -> AnyPublisher<WorkoutDependencies, Error> where
      HealthInterfacePublisher.Output == HealthAuthorizationResult?,
      ActivityTypePublisher.Output == WorkoutParameterType,
      HealthInterfacePublisher.Failure == Never,
      ActivityTypePublisher.Failure == Never
  }
#endif
