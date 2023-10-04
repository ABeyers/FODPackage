//
// Index.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

struct FODSyncServerApp: Product, Target {
  var dependencies: any Depndencies {
    FODSyncServer()
  }
}

struct FODSyncServer: Target {
  var dependencies: any Depndencies {
    FitnessStream()
    FitnessStreamReporter()
    VaporOpenAPI()
    YAMS()
    VaporAPNS()
    Fluent()
    FluentPostgresDriver()
    JWT()
    Redis()
    Vapor()
    RouteGroups()
  }
}

let package = Package {
  FODSyncServerApp()
  FODSyncKit()
}
