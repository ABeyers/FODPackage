//
// AppInterface.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public protocol AppInterface {
  static var sharedInterface: AppInterface { get }
  static var currentDevice: Device { get }
}

public extension AppInterface {
  static var notificationTopic: String? {
    Bundle.main.bundleIdentifier
  }
}
