//
// BrandingRangeCollection.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public struct BrandingRangeCollection<ValueType: Comparable, ElementType> {
  public init(minimumValue: ElementType, nilColor: ElementType, values: [BrandingRange<ValueType, ElementType>]) {
    self.minimumValue = minimumValue
    self.nilColor = nilColor
    self.values = values
  }

  public init(defaultColor: ElementType, values: [BrandingRange<ValueType, ElementType>]) {
    self.init(minimumValue: defaultColor, nilColor: defaultColor, values: values)
  }

  let minimumValue: ElementType
  let nilColor: ElementType
  let values: [BrandingRange<ValueType, ElementType>]

  public func color(forValue value: ValueType?) -> ElementType {
    guard let value else {
      return nilColor
    }

    let backgroundColorRange = values.filter {
      value >= $0.minimumValue
    }.max {
      $0.minimumValue < $1.minimumValue
    }

    guard let backgroundColor = backgroundColorRange?.color else {
      return minimumValue
    }

    return backgroundColor
  }
}

#if canImport(SwiftUI)
  import SwiftUI
  public extension BrandingRangeCollection {
    init(colors: BrandColorSet, values _: [Double]) where ElementType == Color, ValueType == Double {
      self.init(defaultColor: colors.color(fromLevel: .level1), values: [
        .init(color: colors.color(fromLevel: .level2), minimumValue: BrandingRangeColorValues.blue),
        .init(color: colors.color(fromLevel: .level3), minimumValue: BrandingRangeColorValues.green),
        .init(color: colors.color(fromLevel: .level4), minimumValue: BrandingRangeColorValues.yellow),
        .init(color: colors.color(fromLevel: .level5), minimumValue: BrandingRangeColorValues.red)
      ])
    }
  }
#endif
