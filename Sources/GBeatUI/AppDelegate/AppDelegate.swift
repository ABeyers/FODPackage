//
// AppDelegate.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(SwiftUI)
  import FelinePine
  import FitnessStream
  import Foundation
  import GBeatKit
  import HealthKit
  import SwiftUI
  import UserNotifications

  public class AppDelegate: NSObject, ObservableObject, LoggerCategorized {
    @Published var workoutConfiguration: HKWorkoutConfiguration?
    @Published var launchedFromPhone = false

    public func didReceiveWorkoutConfiguration(_ configuration: HKWorkoutConfiguration, from _: some AppInterface) {
      Task { @MainActor in
        self.workoutConfiguration = configuration
        self.launchedFromPhone = true
      }
    }

    public static var loggingCategory: FitnessStream.LoggerCategory {
      .ui
    }

    public typealias LoggersType = HeartwitchLoggers
  }
#endif
