//
// Quantity.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

@propertyWrapper
public struct Quantity {
  public var wrappedValue: Double?

  public let type: QuantityType
  public let statsticsType: StatisticsType
  public let units: String

  public init(type: QuantityType, units: String, using statsticsType: StatisticsType) {
    self.type = type
    self.units = units
    self.statsticsType = statsticsType
  }

  public mutating func update(from values: [QuantityType: QuantityValue]) {
    if let value = values[type]?.value(from: units, using: statsticsType) {
      wrappedValue = value
    }
  }
}
