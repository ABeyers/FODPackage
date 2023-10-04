//
// HealthInterface.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
public protocol HealthInterface {
  func workout(withConfiguration configuration: WorkoutConfiguration) throws -> any WorkoutStream

  func dateOfBirthComponents() throws -> DateComponents
  
  #if os(iOS)
  func startWatchApp(withActivity activity: ActivityType) async throws 
  #endif
}
