//
// Application.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import GBeatKit
import Vapor

extension Vapor.Application {
  var webSockets: WebSocketRepository! {
    get {
      storage[WebSocketRepositoryKey.self]
    }
    set {
      precondition(storage[WebSocketRepositoryKey.self] == nil)
      storage[WebSocketRepositoryKey.self] = newValue
    }
  }
}
