//
// ActivityTypeComponents.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

@available(watchOS 7.0, iOS 14.0, *)
public protocol ActivityTypeComponents {
  var rawValue: ActivityTypeId.RawValue? { get }
  var description: String { get }
  var isPopular: Bool { get }
}
