//
// Array+TestTargets.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

extension [TestTarget]: TestTargets {
  func appending(_ testTargets: any TestTargets) -> [TestTarget] {
    self + testTargets
  }
}
