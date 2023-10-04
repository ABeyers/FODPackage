//
// ServerBaseURLProvider.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

@available(*, deprecated)
public protocol ServerBaseURLProvider {
  var currentBaseURL: URL { get }
  func updateServer(_ server: Server)
}
