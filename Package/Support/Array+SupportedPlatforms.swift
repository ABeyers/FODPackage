//
// Array+SupportedPlatforms.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

extension [SupportedPlatform]: SupportedPlatforms {
  func appending(_ platforms: any SupportedPlatforms) -> Self {
    self + .init(platforms)
  }
}
