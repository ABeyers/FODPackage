//
// NoFacilityView.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(SwiftUI) && os(watchOS)
  import SwiftUI

  @available(OSX 11.0, iOS 14.0, watchOS 7.0, *)
  struct NoFacilityView: View {
    public var body: some View {
      Text("Visit your gym to start a workout.")
        .multilineTextAlignment(.center)
    }
  }
#endif
