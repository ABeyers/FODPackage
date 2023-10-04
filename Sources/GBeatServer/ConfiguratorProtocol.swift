//
// ConfiguratorProtocol.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Vapor

public protocol ConfiguratorProtocol {
  func configure(_ app: Application) throws
}
