//
// UIApplicationDelegate.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

// swiftlint:disable:this file_name
#if os(iOS)
  import Foundation
  import UIKit

  extension AppDelegate: UIApplicationDelegate {
    public func application(_: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
      assertionFailure("Unable to register logging: \(error.localizedDescription)")
      Self.logger.error("Unable to register logging: \(error.localizedDescription)")
    }
  }
#endif
