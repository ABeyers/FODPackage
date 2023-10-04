//
// Server+Defaults.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FitnessStream
import Foundation

public extension Server {
  init(name: String, hostURL: URL, isProduction: Bool = false) {
    var baseURL = hostURL
    baseURL.appendPathComponent(Defaults.apiPath)
    self.init(name: name, baseURL: baseURL, isProduction: isProduction)
  }

  enum Defaults {
    public static let defaultBaseURL = URL(string: "https://gbeat.com")!
    static let apiPath = "/api/v1/"
    public static let defaultServerAPIURL = Self.defaultBaseURL.appendingPathComponent(apiPath)
    public static let production: Server = .init(name: "gBeat", baseURL: Self.defaultServerAPIURL, isProduction: true)
    @available(*, unavailable)
    static let beta: Server = .init(name: "Beta", baseURLString: "https://beta.gbeat.com", apiPath: apiPath, isProduction: false)
    public static let all: [Server] = ([
      Self.production
    ] + ProcessInfo.processInfo.servers)
  }
}
