//
// _PackageDescription_Product.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

extension _PackageDescription_Product {
  static func entry(_ entry: Product) -> _PackageDescription_Product {
    let targets = entry.productTargets.map(\.name)

    switch entry.productType {
    case .executable:
      return Self.executable(name: entry.name, targets: targets)

    case .library:
      return Self.library(name: entry.name, targets: targets)
    }
  }
}
