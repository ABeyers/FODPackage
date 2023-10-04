//
// GBTextField.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(SwiftUI)
  import SwiftUI

  @available(macOS 11.0, iOS 14.0, *)
  struct GBTextField: View {
    @Environment(\.colorScheme) var colorScheme
    var titleKey: LocalizedStringKey
    @Binding var text: String

    var body: some View {
      TextField(titleKey, text: $text)
        .foregroundColor(colorScheme == .dark ? Color.white : Color.gray)
        .background(RoundedRectangle(cornerRadius: Design.xsmall)
          .foregroundColor(colorScheme == .dark ? Color.navy : Color.white))
        .padding(Design.small)
        .overlay(RoundedRectangle(cornerRadius: Design.xsmall)
          .stroke(Color.gray, lineWidth: Design.lineWidth))
        .font(.interBody)
    }
  }
#endif
