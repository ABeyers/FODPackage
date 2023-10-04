//
// HealthAuthorizationConfigurationContainer.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//
import FitnessStream
import FitnessStream
@available(watchOS 7.0, iOS 14.0, macOS 13.0, *)
public protocol HWHealthAuthorizationConfigurationContainer {
  var healthAuth: Factory<HealthAuthorizationConfiguration, HealthAuthorizer> { get }
}

#if canImport(HealthKit)
  import HealthKit

  @available(watchOS 7.0, iOS 14.0, macOS 13.0, *)
public extension HWHealthAuthorizationConfigurationContainer {
    static func healthAuthorizer(fromConfiguration configuration: HealthAuthorizationConfiguration) -> HealthAuthorizer {
      HealthKitAuthorizer(authorization: configuration)
    }
  }

#else

  @available(macOS 13.0, *)
  extension HWHealthAuthorizationConfigurationContainer {
    static func healthAuthorizer(fromConfiguration _: HealthAuthorizationConfiguration) -> HealthAuthorizer {
      fatalError()
    }
  }

#endif
