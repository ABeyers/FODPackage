//
// Array+Depedencies.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

extension [Dependency]: Dependencies {
  func appending(_ dependencies: any Dependencies) -> [Dependency] {
    self + dependencies
  }
}
