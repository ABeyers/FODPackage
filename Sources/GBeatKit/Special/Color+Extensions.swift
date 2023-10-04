//
// Color+Extensions.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(SwiftUI)
  import SwiftUI

  @available(macOS 11.0, iOS 14.0, *)

  public extension Color {
    static let navy = Color("Navy", bundle: .module)
    static let gold = Color("Gold", bundle: .module)
    static let labelPrimary = Color("LabelPrimary", bundle: .module)
    static let lightPutple = Color("LightPurple", bundle: .module)
  }
#endif
