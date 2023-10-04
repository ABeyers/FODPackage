//
// InternalError.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public enum InternalError: Error {
  case invalidDateComponents(DateComponents)
  case missingEnvironmentVariable(String)
  case invalidActivityTypeValue(ActivityTypeId.RawValue)
  case encoding(Any, Error)
}
