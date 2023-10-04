//
// HealthAuthorizationConfiguration.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public struct HealthAuthorizationConfiguration: DefaultConfigurable {
  public let sharedTypes: [SampleType]
  public let readTypes: [ObjectType]

  public static let `default` = HealthAuthorizationConfiguration(sharedTypes: [
    ObjectTypes.quantity.activeEnergyBurned,
    ObjectTypes.quantity.heartRate,
    ObjectTypes.workout
  ], readTypes: [
    ObjectTypes.quantity.activeEnergyBurned,
    ObjectTypes.quantity.heartRate,
    ObjectTypes.workout,
    ObjectTypes.characteristic.dateOfBirth
  ])

  public init(
    sharedTypes: [SampleType], readTypes: [ObjectType]

  ) {
    self.sharedTypes = sharedTypes
    self.readTypes = readTypes
  }
}
