//
// QuantityValue.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public protocol QuantityValue {
  func value(from units: String, using type: StatisticsType) -> Double?
}
