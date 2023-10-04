//
// StyleColor.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(CoreGraphics)
  import CoreGraphics

  #if CGFLOAT_IS_DOUBLE
    public typealias ColorValueInteger = Int
  #else
    public typealias ColorValueInteger = UInt32
  #endif
#else
  public typealias ColorValueInteger = Int
#endif

public struct StyleColor: Codable {
  public let value: ColorValueInteger

  public init(value: ColorValueInteger) {
    self.value = value
  }

  public init(from decoder: Decoder) throws {
    value = try decoder.singleValueContainer().decode(ColorValueInteger.self)
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(value)
  }
}
