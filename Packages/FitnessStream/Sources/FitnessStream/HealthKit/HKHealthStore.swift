//
// HKHealthStore.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(HealthKit)
  import HealthKit
@available(macOS 13.0, watchOS 7.0, iOS 14.0, *)
extension HKHealthStore: HealthInterface {
#if os(iOS)
  public func startWatchApp(withActivity activity: ActivityType) async throws {
    let workoutConfiguration = HKWorkoutConfiguration()
    workoutConfiguration.activityType = activity.healthKitType
    try await self.startWatchApp(toHandle: workoutConfiguration)
  }
  #endif

  
  
  
    public func workout(withConfiguration configuration: WorkoutConfiguration) throws -> any WorkoutStream {
      let hkConfig = HKWorkoutConfiguration()
      hkConfig.activityType = configuration.activityType.healthKitType
      hkConfig.locationType = .indoor
      #if os(watchOS)
        return try HealthKitLiveWorkout(fromHealthStore: self, withConfiguration: hkConfig)
      #else
        return try HealthKitWorkout(fromHealthStore: self, withConfiguration: hkConfig)
      #endif
    }
  }
#endif
