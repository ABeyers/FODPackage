//
// CheckoutSession.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public struct CheckoutSession: Codable {
  public init(id: String) {
    self.id = id
  }

  public let id: String
}
