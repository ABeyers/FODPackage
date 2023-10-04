//
// WorkoutData.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public struct WorkoutData : CustomStringConvertible {
  public let heartRate: Double?
  public let activeEnergyBurned: Double?
  
  public var description: String {
    var description = ""
    
    if let heartRate {
      description += "heartRate : \(heartRate)"
    }
    
    if let activeEnergyBurned {
      description += "activeEnergyBurned : \(activeEnergyBurned)"
    }
    
    return description.isEmpty ? "(empty)" : "{ \(description) }"
  }

  public init(heartRate: Double? = nil, activeEnergyBurned: Double? = nil) {
    self.heartRate = heartRate
    self.activeEnergyBurned = activeEnergyBurned
  }

  public func updated(with new: WorkoutData) -> WorkoutData {
    let heartRate = new.heartRate ?? heartRate
    let activeEnergyBurned = new.activeEnergyBurned ?? activeEnergyBurned
    return WorkoutData(heartRate: heartRate, activeEnergyBurned: activeEnergyBurned)
  }
}

extension WorkoutData: Codable {}
