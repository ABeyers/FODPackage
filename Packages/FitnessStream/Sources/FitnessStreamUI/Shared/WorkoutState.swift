//
// WorkoutState.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//
#if canImport(HealthKit) && os(watchOS)
import Foundation


  import HealthKit
import FitnessStream



  public extension WorkoutState {
    init(fromHealthKit hkWorkoutSessionState: HKWorkoutSessionState) {
      self.init(rawValue: hkWorkoutSessionState.rawValue)!
    }
  }
#endif
