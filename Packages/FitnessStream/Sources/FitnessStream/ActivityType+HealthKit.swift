//
// ActivityType.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//


#if canImport(HealthKit)
  import HealthKit

  @available(watchOS 7.0, iOS 14.0, macOS 13.0, *)
  public extension ActivityType {
    
    var healthKitType: HKWorkoutActivityType {
      guard let result = HKWorkoutActivityType(rawValue: UInt(id.rawValue)) else {
        preconditionFailure()
      }
      return result
    }
  }

@available(watchOS 7.0, iOS 14.0, macOS 13.0, *)
public struct HealthKitActvityTypeComponents : ActivityTypeComponents {
  public init(activityType: HKWorkoutActivityType) {
    self.activityType = activityType
  }
  
  public var rawValue: ActivityTypeId.RawValue? {
    Int(activityType.rawValue)
  }
  
  public let description: String = ""
  
  public let isPopular: Bool = false
  
  let activityType : HKWorkoutActivityType
  
}

#endif
