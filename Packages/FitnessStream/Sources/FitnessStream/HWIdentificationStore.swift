//
// IdentificationStore.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public protocol HWIdentificationStore: AnyObject {
  var userID: UUID? { get set }
  var recordID: UUID? { get set }
  var deviceIdentifier: UUID? { get set }
}
