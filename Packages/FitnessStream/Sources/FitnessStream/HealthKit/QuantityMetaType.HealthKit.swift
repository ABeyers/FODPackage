//
// QuantityMetaType.HealthKit.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(HealthKit)
  import HealthKit

  public extension QuantityMetaType {
    @available(macOS 13.0, *)
    public func healthKitSampleType(from value: String?) -> HKSampleType? {
      value.map(HKQuantityTypeIdentifier.init).flatMap(HKQuantityType.quantityType(forIdentifier:))
    }
  }
#endif
