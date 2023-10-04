//
// ContactRequest.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public struct ContactRequest: Codable {
  public let emailAddress: String
  public let name: String
  public let message: String
}
