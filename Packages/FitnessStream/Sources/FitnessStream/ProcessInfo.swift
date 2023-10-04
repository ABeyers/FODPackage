//
// ProcessInfo.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public extension ProcessInfo {
  var servers: [Server] {
    #if DEBUG
      environment.compactMap { pair -> Server? in
        let (key, value) = pair
        let comps = key.components(separatedBy: "__")
        guard let name = comps.last, comps.first == Server.Environment.prefix, comps.count == 2 else {
          return nil
        }
        guard let baseURL = URL(string: value) else {
          return nil
        }

        return Server(name: name, baseURL: baseURL, isProduction: false)
      }
    #else
      return []
    #endif
  }

  var defaultServer: Server? {
    //#if DEBUG
      let server = environment["DEFAULT_SERVER"].flatMap { name in
        self.servers.first(where: { $0.name == name })
      }
      return server
//    #else
//      #warning("replace with production later")
//      return Server.Defaults.production
//    #endif
  }
}
