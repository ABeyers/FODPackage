//
// WorkoutType.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public struct WorkoutType: SampleType {
  public let sampleRawValue: String? = nil

  public static let sampleMetaType: SampleMetaType = WorkoutMetaType()

  struct WorkoutMetaType: SampleMetaType {}
}
