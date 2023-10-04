//
// OutlinedButtonStyle.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(SwiftUI)
  import SwiftUI

  @available(macOS 11.0, iOS 14.0, *)
  struct OutlinedButton: ButtonStyle {
    var foregroundColor: Color
    var strokeColor = Color.secondary
    var width = Design.large * 4
    var height = Design.large

    func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .padding()
        .font(.interButtonBold)
        .foregroundColor(foregroundColor)
        .frame(width: width, height: height)
        .background(RoundedRectangle(cornerRadius: Design.large)
          .stroke(strokeColor))
        .opacity(configuration.isPressed ? 0.5 : 1)
    }
  }
#endif
