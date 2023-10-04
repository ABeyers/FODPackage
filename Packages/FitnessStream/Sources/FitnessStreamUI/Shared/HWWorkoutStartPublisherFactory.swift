//
// WorkoutStartPublisherFactory.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//


#if canImport(Combine)
  import Combine
  import Foundation
import FitnessStream
  @available(watchOS 7.0, iOS 14.0, *)
@available(*, deprecated)
public struct WorkoutStartPublisherFactory: HWWorkoutStartPublicist {

  
    public init() {}
    public func publisher<HealthInterfacePublisher: Publisher, ActivityTypePublisher: Publisher>(
      basedOn healthInterfaceResult: HealthInterfacePublisher,
      withActivtyTypePublisher activityTypeIdValue: ActivityTypePublisher
    ) -> AnyPublisher<WorkoutDependencies, Error>
      where HealthInterfacePublisher.Output == HealthAuthorizationResult?,
      ActivityTypePublisher.Output == ActivityTypeId.RawValue,
      HealthInterfacePublisher.Failure == Never,
      ActivityTypePublisher.Failure == Never {
      let healthPublisher = healthInterfaceResult.compactMap { $0 }.tryMap {
        try $0.get()
      }
      let activityTypePublisher = activityTypeIdValue.map(ActivityType.from(rawValue:)).setFailureType(to: Error.self)
      return healthPublisher.combineLatest(activityTypePublisher).eraseToAnyPublisher()
    }
  }
#endif
