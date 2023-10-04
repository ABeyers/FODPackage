//
// CharacteristicType.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public struct CharacteristicMetaType: ObjectMetaType {}

public struct CharacteristicType: ObjectType, Hashable {
  public static let objectMetaType: ObjectMetaType = CharacteristicMetaType()

  public var objectRawValue: String? {
    id.rawValue
  }

  public let id: CharacteristicTypeId

  public init(id: CharacteristicTypeId) {
    self.id = id
  }

  internal init(rawValue: CharacteristicTypeId.RawValue) {
    guard let id = CharacteristicTypeId(rawValue: rawValue) else {
      preconditionFailure()
    }

    self.id = id
  }

  // Measurements
  public static let dateOfBirth = CharacteristicType(id: .dateOfBirth)
}
