//
// SampleMetaType.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(HealthKit)
  import HealthKit
  public protocol SampleMetaType: ObjectMetaType {
    @available(macOS 13.0, *)
    func healthKitSampleType(from value: String?) -> HKSampleType?
  }

  public extension SampleMetaType {
    @available(macOS 13.0, *)
    func healthKitObjectType(from value: String?) -> HKObjectType? {
      healthKitSampleType(from: value)
    }
  }

  public protocol ObjectMetaType {
    @available(macOS 13.0, *)
    func healthKitObjectType(from value: String?) -> HKObjectType?
  }

#else
  public protocol SampleMetaType: ObjectMetaType {}
  public protocol ObjectMetaType {}

#endif
