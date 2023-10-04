//
// Device.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public protocol Device {
  var systemVersion: String { get }
}

#if canImport(Darwin)
  import Darwin

  public extension Device {
    var name: String {
      var systemInfo = utsname()
      uname(&systemInfo)
      let str = withUnsafePointer(to: &systemInfo.machine.0) { ptr in
        String(cString: ptr)
      }
      return str
    }
  }
#endif
