//
// WatchConfiguration.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FitnessStream
import FitnessStreamUI
import Foundation
import GBeatKit

@available(watchOS 7.0, iOS 14.0, *)
public class WatchConfiguration {
  var healthAuth: Factory<HealthAuthorizationConfiguration, HealthAuthorizer>

  init() {
    healthAuth = Factory(
      configurationType: HealthAuthorizationConfiguration.self,
      factory: Self.healthAuthorizer
    )
  }

  static let `default` = WatchConfiguration()
}

#if canImport(HealthKit) && !os(macOS)
  import HealthKit

  @available(watchOS 7.0, iOS 14.0, *)
  extension WatchConfiguration {
    static func healthAuthorizer(fromConfiguration configuration: HealthAuthorizationConfiguration) -> HealthAuthorizer {
      HealthKitAuthorizer(authorization: configuration)
    }
  }

#else

  @available(watchOS 7.0, iOS 14.0, *)
  extension WatchConfiguration {
    static func healthAuthorizer(fromConfiguration _: HealthAuthorizationConfiguration) -> HealthAuthorizer {
      fatalError()
    }
  }

#endif
