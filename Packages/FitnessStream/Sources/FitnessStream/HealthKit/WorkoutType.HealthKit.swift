//
// WorkoutType.HealthKit.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(HealthKit)

  import HealthKit

  extension WorkoutType.WorkoutMetaType {
    @available(macOS 13.0, *)
    func healthKitSampleType(from _: String?) -> HKSampleType? {
      HKSampleType.workoutType()
    }
  }

#endif
