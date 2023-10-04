//
// SampleType.HealthKit.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(HealthKit)
  import HealthKit

public extension SampleType {
    @available(macOS 13.0, *)
    var healthKitSampleType: HKSampleType {
      guard let type = Self.sampleMetaType.healthKitSampleType(from: sampleRawValue) else {
        preconditionFailure()
      }
      return type
    }
  }

  public extension ObjectType {
    @available(macOS 13.0, *)
    var healthKitObjectType: HKObjectType {
      guard let type = Self.objectMetaType.healthKitObjectType(from: objectRawValue) else {
        preconditionFailure()
      }
      return type
    }
  }

#endif
