//
// SupportedPlatforms.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

protocol SupportedPlatforms: Sequence where Element == SupportedPlatform {
  // swiftlint:disable:next identifier_name
  init<S>(_ s: S) where S.Element == SupportedPlatform, S: Sequence
  func appending(_ platforms: any SupportedPlatforms) -> Self
}
