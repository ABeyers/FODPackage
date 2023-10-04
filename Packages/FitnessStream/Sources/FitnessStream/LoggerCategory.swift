//
// LoggerCategory.swift
// Copyright (c) 2022 BrightDigit.
//

import Foundation
import FelinePine

#if canImport(os)
  import os
#else
  import Logging
#endif

public enum LoggerCategory: String, CaseIterable {
  case reactive
  // swiftlint:disable:next identifier_name
  case ui
  case userDefaults
  case watchConnectivity
  case authentication
  case networking
  case server
  case healthKit
  case cloudKit
}

public struct HeartwitchLoggers : Loggers {
  public static let loggers: [LoggerCategory : Logger] = Self._loggers
}

extension Logger {
  public static func forCategory(_ category: LoggerCategory) -> Logger {
    guard let logger = HeartwitchLoggers.loggers[category] else {
      preconditionFailure("missing logger")
    }
    return logger
  }
}
