//
// _Named.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

protocol _Named {
  var name: String { get }
}

extension _Named {
  var name: String {
    "\(Self.self)"
  }
}
