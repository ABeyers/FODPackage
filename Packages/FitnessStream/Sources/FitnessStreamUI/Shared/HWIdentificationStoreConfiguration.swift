//
// IdentificationStoreConfiguration.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
import FitnessStream
import FitnessStream
public struct HWIdentificationStoreConfiguration: DefaultConfigurable {
  public static let `default` = HWIdentificationStoreConfiguration(identificationStore: UserDefaults.standard)

  public let identificationStore: HWIdentificationStore
}
