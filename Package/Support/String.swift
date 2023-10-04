//
// String.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

extension String {
  var packageName: String? {
    split(separator: "/").last?.split(separator: ".").first.map(String.init)
  }
}
