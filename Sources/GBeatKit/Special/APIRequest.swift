//
// APIRequest.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FitnessStream
import Foundation

@available(*, deprecated)
public enum APIRequest {
  case getIdentifier(String)
  #if targetEnvironment(simulator)
    @available(*, deprecated)
    case simulatorSession(Data)
  #endif
  case dataForWorkoutWithID(Int, updatedWith: WorkoutData)
  case workout(withID: Int)
  case create(AuthenticationInfo)
  case url(URL)
  case profile
  case buildNumber(String)
  case patchMobileDevice(PatchMobileDeviceRequestContent, id: UUID)
  case createMobileDevice(CreateMobileDeviceRequestContent)
  case removeMobileDevice(id: UUID)
}
