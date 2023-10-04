//
// Server.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public struct Server: Identifiable {
  public init(name: String, baseURL: URL, isProduction: Bool = false) {
    self.name = name
    self.baseURL = baseURL
    self.isProduction = isProduction
  }

  public init(name: String, baseURLString: String, apiPath: String? = nil, isProduction: Bool = false) {
    var baseURL = URL(string: baseURLString)!
    if let apiPath = apiPath {
      baseURL.appendPathComponent(apiPath)
    }

    self.init(name: name, baseURL: baseURL, isProduction: isProduction)
  }
  
  


  public var id: String {
    name
  }

  public let name: String
  public let baseURL: URL
  public let isProduction: Bool
}

public extension Server {
  enum Environment {
    static let prefix = "HW_SERVER"
    static let separator = "__"
  }
}
