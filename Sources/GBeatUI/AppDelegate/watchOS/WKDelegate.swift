//
// WKDelegate.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

// swiftlint:disable:this file_name
#if canImport(WatchKit) && canImport(SwiftUI)
  import HealthKit
  import SwiftUI
  import WatchKit
  extension AppDelegate: WKDelegate {
    public func handle(_ workoutConfiguration: HKWorkoutConfiguration) {
      didReceiveWorkoutConfiguration(workoutConfiguration, from: WKAppPolyfill.shared())
    }
  }
#endif
