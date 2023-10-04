//
// TestTargets.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

protocol TestTargets: Sequence where Element == TestTarget {
  // swiftlint:disable:next identifier_name
  init<S>(_ s: S) where S.Element == TestTarget, S: Sequence
  func appending(_ testTargets: any TestTargets) -> Self
}
