//
// Encoding.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

extension DateFormatter {
  convenience init(formatString: String) {
    self.init()
    dateFormat = formatString
  }
}

public enum Encoding {
  static let dateFormatter = DateFormatter(formatString: "YYYY-MM-dd'T'HH:mm:ss.SSSZ")
  static let jsonDecoder: JSONDecoder = .init(dateDecodingStrategy: .formatted(Self.dateFormatter))
  static let jsonEncoder: JSONEncoder = .init(dateEncodingStrategy: .formatted(Self.dateFormatter))
}
