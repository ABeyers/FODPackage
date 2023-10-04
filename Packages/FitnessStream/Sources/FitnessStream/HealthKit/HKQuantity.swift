//
// HKQuantity.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(HealthKit) && !os(macOS)
  import HealthKit

  extension HKStatistics: QuantityValue {
    public func quantity(using type: StatisticsType) -> HKQuantity? {
      switch type {
      case .mostRecent:
        return mostRecentQuantity()
      case .sum:
        return sumQuantity()
      }
    }

    public func value(from units: String, using type: StatisticsType) -> Double? {
      quantity(using: type)?.doubleValue(for: HKUnit(from: units))
    }
  }
#endif
