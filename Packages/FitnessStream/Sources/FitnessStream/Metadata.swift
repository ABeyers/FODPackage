//
// Metadata.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public protocol Metadata {
  var buildNumber: String { get }
  var model: String { get }
  var systemName: String { get }
  var systemVersion: String { get }
  var marketingVersion: String { get }
}
