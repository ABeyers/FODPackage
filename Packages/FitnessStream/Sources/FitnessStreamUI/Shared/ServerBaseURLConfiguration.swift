//
// ServerBaseURLConfiguration.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
import FitnessStream

public class ServerBaseURLConfiguration: ServerBaseURLProvider {
  public init(selectedServer: Server) {
    self.selectedServer = selectedServer
  }

  public private(set) var selectedServer: Server
  public var currentBaseURL: URL {
    selectedServer.baseURL
  }

  public func updateServer(_ server: Server) {
    selectedServer = server
  }
}
