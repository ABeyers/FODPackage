//
// String.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public extension String {
  func frontPadding(toLength length: Int, withPad pad: String, startingAt index: Int) -> String {
    String(String(reversed()).padding(toLength: length, withPad: pad, startingAt: index).reversed())
  }
  
  public static func dumping(_ object: Any?) -> String {
    var dumped = String()
    dump(object, to: &dumped)
    return dumped
  }
}
