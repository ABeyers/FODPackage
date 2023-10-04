//
// WorkoutDelegate.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public protocol WorkoutDelegate: AnyObject {
  func workout(_ workout: any WorkoutStream, failedWith error: WorkoutError)
  func workout(_ workout: any WorkoutStream, collected data: WorkoutData)
  func workout(_ workout: any WorkoutStream, didChangeTo newState: WorkoutState, from oldState: WorkoutState, atDate date: Date)
}
