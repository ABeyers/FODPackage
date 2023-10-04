//
// NoPhoneConnectionView.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(SwiftUI) && os(watchOS)
  import SwiftUI

  @available(OSX 11.0, iOS 14.0, watchOS 7.0, *)
  struct NoPhoneConnectionView: View {
    public var body: some View {
      Text("Please log into the Fitness On Demand app on your mobile device.")
        .multilineTextAlignment(.center)
    }
  }
#endif
