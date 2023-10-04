//
// WorkoutDataBuilder.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public struct WorkoutDataBuilder {
  @Quantity(type: .heartRate, units: "count/min", using: .mostRecent)
  var heartRate: Double?

  @Quantity(type: .activeEnergyBurned, units: "kcal", using: .sum)
  var activeEnergyBurned: Double?

  public init(data: [QuantityType: QuantityValue]) {
    _activeEnergyBurned.update(from: data)
    _heartRate.update(from: data)
  }

  public func result() -> WorkoutData {
    WorkoutData(heartRate: heartRate, activeEnergyBurned: activeEnergyBurned)
  }
}
