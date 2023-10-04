//
// WorkoutEvent.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public enum WorkoutEvent {
  case data(WorkoutData, Result<WorkoutDataUpdateResponse, Error>)
  case finished(Error?)
  case creationFailed(Error)
  case startFailed(WorkoutError)
}
