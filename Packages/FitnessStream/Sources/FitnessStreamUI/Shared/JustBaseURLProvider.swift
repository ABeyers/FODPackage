//
// JustBaseURLProvider.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
import FitnessStream
import FitnessStream
struct JustBaseURLProvider: ServerBaseURLProvider {
  static let apiPath = "/api/v1/"

  internal init(currentBaseURL: URL) {
    self.currentBaseURL = currentBaseURL
  }

  let currentBaseURL: URL

  func updateServer(_: Server) {}
}
