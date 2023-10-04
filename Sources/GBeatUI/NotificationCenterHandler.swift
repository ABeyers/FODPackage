//
// NotificationCenterHandler.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(UserNotifications)
  import FelinePine
  import FitnessStream
  import Foundation
  import GBeatKit
  import UserNotifications

  class NotificationCenterHandler: NSObject, UNUserNotificationCenterDelegate, LoggerCategorized {
    static var loggingCategory: FitnessStream.LoggerCategory {
      .ui
    }

    typealias LoggersType = HeartwitchLoggers

    @MainActor
    func userNotificationCenter(_: UNUserNotificationCenter, didReceive _: UNNotificationResponse) async {
      #warning("How do we handle notifications")
    }

    @MainActor
    func userNotificationCenter(_: UNUserNotificationCenter, willPresent _: UNNotification) async -> UNNotificationPresentationOptions {
      [.badge, .sound, .banner]
    }
  }
#endif
