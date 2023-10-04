//
// UUID.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public extension UUID {
  init(data: Data) {
    var bytes = [UInt8](repeating: 0, count: data.count)
    _ = bytes.withUnsafeMutableBufferPointer {
      data.copyBytes(to: $0)
    }
    self = NSUUID(uuidBytes: bytes) as UUID
  }

  var data: NSData {
    let bytes = Array(uuid: self)
    return Data(bytes) as NSData
  }

  var lastInteger: UInt64 {
    let bytes = Array(uuid: self)
    return bytes.withUnsafeBytes {
      $0.load(fromByteOffset: bytes.count - 8, as: UInt64.self)
    }
  }

  var shortCode: String {
    let string = String(lastInteger)
    return string.suffix(19).padding(toLength: 19, withPad: "0", startingAt: 0)
  }

  func shortCodeSuffix(forLength length: Int) -> Substring {
    shortCode.suffix(length)
  }
}
