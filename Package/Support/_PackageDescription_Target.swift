//
// _PackageDescription_Target.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

extension _PackageDescription_Target {
  static func entry(_ entry: Target) -> _PackageDescription_Target {
    let dependencies = entry.dependencies.map(\.targetDepenency)
    switch entry.targetType {
    case .executable:
      return .executableTarget(name: entry.name, dependencies: dependencies)

    case .regular:
      return .target(name: entry.name, dependencies: dependencies)

    case .test:
      return .testTarget(name: entry.name, dependencies: dependencies)
    }
  }
}
