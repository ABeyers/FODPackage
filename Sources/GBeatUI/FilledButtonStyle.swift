//
// FilledButtonStyle.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(SwiftUI)
  import SwiftUI

  @available(macOS 11.0, iOS 14.0, *)
  struct FilledButtonStyle: ButtonStyle {
    var foregroundColor: Color
    var backgroundColor = Color.accentColor
    var width = Design.large * 4
    var height = Design.large
    var fullWidth = false

    func makeBody(configuration: Configuration) -> some View {
      if fullWidth {
        configuration.label
          .padding(.all, Design.small)
          .font(.interButtonBold)
          .foregroundColor(foregroundColor)
          .frame(maxWidth: .infinity)
          .cornerRadius(Design.large)
          .background(RoundedRectangle(cornerRadius: Design.large)
            .fill(Color.gold))
          .opacity(configuration.isPressed ? 0.5 : 1)
      } else {
        configuration.label
          .padding(.all, Design.small)
          .font(.interButtonBold)
          .foregroundColor(foregroundColor)
          .frame(width: width, height: height)
          .cornerRadius(Design.large)
          .background(RoundedRectangle(cornerRadius: Design.large)
            .fill(Color.gold))
          .opacity(configuration.isPressed ? 0.5 : 1)
      }
    }
  }
#endif
