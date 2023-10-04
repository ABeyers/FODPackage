//
// TestTargetBuilder.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

@resultBuilder
enum TestTargetBuilder {
  static func buildPartialBlock(first: TestTarget) -> any TestTargets {
    [first]
  }

  static func buildPartialBlock(accumulated: any TestTargets, next: TestTarget) -> any TestTargets {
    accumulated + [next]
  }
}
