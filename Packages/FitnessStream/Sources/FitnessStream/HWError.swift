//
// HWError.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public enum HWError: Error {
  case invalidShortId(String)
  case missingWorkout
  case unauthorized
}
