//
// CharacteristicType.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(HealthKit)
  import HealthKit
  @available(macOS 13.0, *)
  public extension CharacteristicMetaType {
    func healthKitObjectType(from value: String?) -> HKObjectType? {
      value.map(HKCharacteristicTypeIdentifier.init(rawValue:)).flatMap(HKCharacteristicType.characteristicType(forIdentifier:))
    }
  }
#endif
