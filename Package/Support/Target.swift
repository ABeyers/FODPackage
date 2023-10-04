//
// Target.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

protocol Target: _Depending, Dependency, _Named {
  var targetType: TargetType { get }
}

extension Target {
  var targetType: TargetType {
    .regular
  }

  var targetDepenency: _PackageDescription_TargetDependency {
    .target(name: name)
  }
}
