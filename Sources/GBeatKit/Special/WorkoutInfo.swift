//
// WorkoutInfo.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FitnessStream
import Foundation

public struct WorkoutInfo {
  public init(displayName: String, userId: Int, age: Int, facilityId: Int, facilityName: String, activityTypeId: Int, activityName: String) {
    let dateOfBirth = Date(timeIntervalSinceNow: TimeInterval(age) * 31_536_000.0)
    self.init(displayName: displayName, userId: userId, dateOfBirth: dateOfBirth, facilityId: facilityId, facilityName: facilityName, activityTypeId: activityTypeId, activityName: activityName)
  }

  public init(displayName: String, userId: Int, dateOfBirth: Date, facilityId: Int, facilityName: String, activityTypeId: Int, activityName: String) {
    self.displayName = displayName
    self.dateOfBirth = dateOfBirth
    self.facilityId = facilityId
    self.facilityName = facilityName
    self.activityTypeId = activityTypeId
    self.activityName = activityName
    self.userId = userId
  }

  public var displayName: String
  public var userId: Int
  public var dateOfBirth: Date
  public var facilityId: Int
  public var facilityName: String
  public var activityTypeId: Int
  public var activityName: String

  public var age: TimeInterval {
    get {
      dateOfBirth.timeIntervalSinceNow / 31_536_000
    }
    set {
      dateOfBirth = .init(timeIntervalSinceNow: newValue * 31_536_000.0)
    }
  }

  enum Parameters: String {
    case displayName
    case userId
    case dateOfBirth
    case facilityId
    case facilityName
    case activityTypeId
    case activityName
  }

  public static var key: String = "WorkoutInfo"

  public init?(from parameters: [String: Any]?) {
    guard let displayName = parameters?[Parameters.displayName.rawValue] as? String else { return nil }
    guard let userId = parameters?[Parameters.userId.rawValue] as? Int else { return nil }
    guard let dateOfBirth = parameters?[Parameters.dateOfBirth.rawValue] as? Date else { return nil }
    guard let facilityId = parameters?[Parameters.facilityId.rawValue] as? Int else { return nil }
    guard let facilityName = parameters?[Parameters.facilityName.rawValue] as? String else { return nil }
    guard let activityTypeId = parameters?[Parameters.activityTypeId.rawValue] as? Int else { return nil }
    guard let activityName = parameters?[Parameters.activityName.rawValue] as? String else { return nil }

    self.displayName = displayName
    self.dateOfBirth = dateOfBirth
    self.facilityId = facilityId
    self.facilityName = facilityName
    self.activityTypeId = activityTypeId
    self.activityName = activityName
    self.userId = userId
  }

  public func parameters() -> [String: Any] {
    [
      Parameters.displayName.rawValue: displayName,
      Parameters.dateOfBirth.rawValue: dateOfBirth,
      Parameters.facilityId.rawValue: facilityId,
      Parameters.facilityName.rawValue: facilityName,
      Parameters.activityTypeId.rawValue: activityTypeId,
      Parameters.activityName.rawValue: activityName,
      Parameters.userId.rawValue: userId
    ]
  }
}

extension WorkoutInfo: ActivityTypeComponents {
  public var rawValue: FitnessStream.ActivityTypeId.RawValue? {
    activityTypeId
  }

  public var description: String {
    activityName
  }

  public var isPopular: Bool {
    false
  }
}
