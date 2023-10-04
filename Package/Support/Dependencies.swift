//
// Dependencies.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

protocol Dependencies: Sequence where Element == Dependency {
  // swiftlint:disable:next identifier_name
  init<S>(_ s: S) where S.Element == Dependency, S: Sequence
  func appending(_ dependencies: any Dependencies) -> Self
}
