//
// Color.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

#if canImport(SwiftUI)

  import SwiftUI

  public protocol BrandColorSet {
    func color(fromLevel level: Color.Level) -> Color
  }

  struct BrandColorGroup: BrandColorSet {
    let group: Color.Group
    let bundle: Bundle?
    func color(fromLevel level: Color.Level) -> Color {
      Color.fromGroup(group, bundle: bundle, atLevel: level)
    }
  }

  public extension Color {
    enum Level: Int, CustomStringConvertible {
      case level1 = 1
      case level2 = 2
      case level3 = 3
      case level4 = 4
      case level5 = 5

      public var description: String {
        "level\(rawValue)"
      }
    }

    enum Group: String {
      case brand = "Brand"
      case primary = "Primary"
    }

    internal static func fromGroup(_ group: Color.Group, bundle: Bundle?, atLevel level: Color.Level) -> Color {
      Color([group.rawValue, level.description].joined(separator: "/"), bundle: bundle)
    }

    enum Branding {
      public static let cream = Color("Cream", bundle: .module)
      public static let orangestYellow = Color("OrangestYellow", bundle: .module)
    }

    enum Brand {
      public static let gBeat: BrandColorSet = BrandColorGroup(group: .brand, bundle: .module)
      public static let primary: BrandColorSet = BrandColorGroup(group: .primary, bundle: .module)
    }
  }
#endif
