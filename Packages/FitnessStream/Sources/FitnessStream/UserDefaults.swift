//
// UserDefaults.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

extension UserDefaults: HWIdentificationStore {
  subscript(key: IdentificationStoreKey) -> UUID? {
    get {
      data(forKey: key.rawValue).flatMap(UUID.init(data:))
    }
    set {
      set(newValue.map(\.data), forKey: key.rawValue)
    }
  }

  public var userID: UUID? {
    get {
      self[.userID]
    }
    set {
      self[.userID] = newValue
    }
  }

  public var recordID: UUID? {
    get {
      self[.recordID]
    }
    set {
      self[.recordID] = newValue
    }
  }

  public var deviceIdentifier: UUID? {
    get {
      self[.deviceIdentifier]
    }
    set {
      self[.deviceIdentifier] = newValue
    }
  }
}
