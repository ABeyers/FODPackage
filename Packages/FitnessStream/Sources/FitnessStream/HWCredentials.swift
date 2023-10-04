//
// Credentials.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

@available(*, deprecated)
public struct HWCredentials {
  public init(username: String, password: String, token: String? = nil) {
    self.username = username
    self.password = password
    self.token = token
  }

  public let username: String
  public let password: String
  public let token: String?

  public func withToken(_ token: String) -> HWCredentials {
    HWCredentials(username: username, password: password, token: token)
  }

  public func withoutToken() -> HWCredentials {
    HWCredentials(username: username, password: password, token: nil)
  }
}

