//
// WorkoutDataUpdateResponse.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public enum WorkoutDataUpdateResponse {
  case notFound
  case started
  case listened
}

public extension WorkoutDataUpdateResponse {
  init?(httpStatusCode: Int) {
    if httpStatusCode == 202 {
      self = .listened
    } else if httpStatusCode / 100 == 2 {
      self = .started
    } else if httpStatusCode / 100 == 4 {
      self = .notFound
    } else {
      return nil
    }
  }
}
