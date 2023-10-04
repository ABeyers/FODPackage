//
// BrandingRange.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public struct BrandingRange<ValueType, ElementType> {
  public init(color: ElementType, minimumValue: ValueType) {
    self.color = color
    self.minimumValue = minimumValue
  }

  let color: ElementType
  let minimumValue: ValueType
}

public enum BrandingRangeColorValues {
  public static let blue = 59.5
  public static let green = 69.5
  public static let yellow = 79.5
  public static let red = 89.5
}
