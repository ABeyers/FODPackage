//
// View.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
#if os(iOS) && canImport(UIKit) && canImport(SwiftUI)
  import SwiftUI
  import UIKit

  @available(macOS 11.0, iOS 14.2, *)
  public extension View {
    func hideKeyboard() {
      UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
  }
#endif
