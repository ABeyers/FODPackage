//
// Product+Target.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

extension Product where Self: Target {
  var productTargets: [Target] {
    [self]
  }

  var targetType: TargetType {
    switch productType {
    case .library:
      .regular

    case .executable:
      .executable
    }
  }
}
