//
// WindowSize.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if os(Linux)
  import Glibc
#else
  import Darwin
#endif

public struct WindowSize {
  let columns: Int
  let rows: Int
  let width: Int
  let height: Int

  public typealias Operation = (CInt, UInt, UnsafeMutablePointer<winsize>) -> CInt
  #if os(Linux)
    static let WindowSizeAttr = UInt(TIOCGWINSZ)
  #else
    static let WindowSizeAttr = TIOCGWINSZ
  #endif

  static let defaultOperation: WindowSize.Operation = {
    ioctl($0, $1, $2)
  }

  init?(_ operation: WindowSize.Operation = defaultOperation) {
    var baseWinSize = winsize()
    guard operation(STDOUT_FILENO, Self.WindowSizeAttr, &baseWinSize) == 0 else {
      return nil
    }
    columns = Int(baseWinSize.ws_col)
    rows = Int(baseWinSize.ws_row)
    width = Int(baseWinSize.ws_xpixel)
    height = Int(baseWinSize.ws_ypixel)
  }
}
