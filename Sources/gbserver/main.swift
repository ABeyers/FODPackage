//
// main.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

// #if canImport(Logging)
//  import struct FitnessStreamReporter.ReporterLogHandler
// #endif

import GBeatServer
import Vapor

var env = try Environment.detect()

var sharedApplication: Application?

// #if canImport(Logging)
//  try LoggingSystem.bootstrap(from: &env) { level in { (label: String) in
//    let console = Terminal()
//    let consoleLogger = ConsoleLogger(label: label, console: console, level: level)
//    let reporterLogger = ReporterLogHandler(label: label, environment: env.name, logLevel: level, reporterAccessor: sharedApplication?.reporter)
//
//    return MultiplexLogHandler([
//      consoleLogger,
//      reporterLogger
//    ])
//  }
//  }
// #endif

let app = Application(env)
sharedApplication = app
defer { app.shutdown() }
try Configurator.shared.configure(app)
try app.run()
