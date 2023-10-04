//
// TestTarget.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

protocol TestTarget: Target {}

extension TestTarget {
  var targetType: TargetType {
    .test
  }
}
