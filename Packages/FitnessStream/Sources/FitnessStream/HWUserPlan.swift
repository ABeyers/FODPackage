//
// UserPlan.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public enum HWUserPlan: String, Codable, CaseIterable {
  public static let schema: String = "UserPlan"

  public static func rawValue(_ case: HWUserPlan) -> String {
    `case`.rawValue
  }

  case starter
  case premium
}
