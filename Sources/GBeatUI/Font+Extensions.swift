//
// Font+Extensions.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(SwiftUI)
  import SwiftUI

  @available(macOS 11.0, iOS 14.0, *)
  extension Font {
    enum Inter {
      static let medium = "Inter-Medium"
      static let bold = "Inter-Bold"
    }

    static let interCaption: Font = .custom(Inter.medium, size: 12, relativeTo: .caption)
    static let interFootnote: Font = .custom(Inter.medium, size: 14, relativeTo: .footnote)
    static let interBody: Font = .custom(Inter.medium, size: 14, relativeTo: .body)
    static let interButtonBold: Font = .custom(Inter.bold, size: 17, relativeTo: .body)
    static let interLargeBody: Font = .custom(Inter.medium, size: 24, relativeTo: .body)
    static let interLargeBodyBold: Font = .custom(Inter.bold, size: 24, relativeTo: .body)
    static let interLargeBoldTitle: Font = .custom(Inter.bold, size: 24, relativeTo: .largeTitle)
    static let interLargeTitle: Font = .custom(Inter.medium, size: 24, relativeTo: .largeTitle)
  }
#endif
