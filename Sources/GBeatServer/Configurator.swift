//
// Configurator.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import APNS
import FitnessStream
import Fluent
import FluentPostgresDriver
import Foundation
import GBeatKit
import JWT
import QueuesFluentDriver
import Redis
import Vapor

public final class Configurator: ConfiguratorProtocol {
  public static let shared: ConfiguratorProtocol = Configurator()

  fileprivate func setupDatabaseFor(_ app: Vapor.Application) throws {
    let postgreSQLConfig: PostgresConfiguration

    if let url = Environment.get("DATABASE_URL") {
      var newPostgreSQLConfig = PostgresConfiguration(url: url)!
      newPostgreSQLConfig.tlsConfiguration = .forClient(certificateVerification: .none)
      postgreSQLConfig = newPostgreSQLConfig
    } else {
      postgreSQLConfig = PostgresConfiguration(hostname: "localhost", username: "gbeat")
    }

    app.databases.use(.postgres(configuration: postgreSQLConfig), as: .psql)

    let redisConfiguration: RedisConfiguration
    if let host = Environment.get("REDIS_HOST") {
      redisConfiguration = try RedisConfiguration(hostname: host)
    } else if let redisURL = Environment.get("REDIS_URL") {
      redisConfiguration = try .init(url: redisURL)
    } else {
      redisConfiguration = try RedisConfiguration(hostname: "localhost")
    }

    app.redis.configuration = redisConfiguration
  }

  ///// Called before your application initializes.
  public func configure(_ app: Vapor.Application) throws {
    ContentConfiguration.global.use(decoder: JSONDecoder.default, for: .json)
    ContentConfiguration.global.use(encoder: JSONEncoder.default, for: .json)
    try setupDatabaseFor(app)

    #if DEBUG
      let isMigrating = CommandLine.arguments.contains("migrate")

      if !isMigrating {
        try app.register(collection: Routes(app: app))
      }
    #else
      try app.register(collection: Routes(app: app))
    #endif

    let enableStaticHosting = Environment.get("NO_STATIC").flatMap(Bool.init) != true
    let rootPath = Environment.get("ROOT_PATH") ?? app.directory.publicDirectory

    app.webSockets = WebSocketRepository(app: app)

    #if DEBUG
      app.middleware.use(CORSMiddleware(configuration: .init(allowedOrigin: .all, allowedMethods: [HTTPMethod.GET], allowedHeaders: [])))
    #else
      app.middleware.use(CORSMiddleware(configuration: .default()))
    #endif

    #if DEBUG
      if enableStaticHosting, !isMigrating {
        app.middleware.use(DirectoryIndexMiddleware(publicDirectory: rootPath))
        try app.middleware.use(IndexServingMiddleware(apiPaths: ["/api"], publicDirectory: rootPath))
      }
    #else
      app.middleware.use(DirectoryIndexMiddleware(publicDirectory: rootPath))
      try app.middleware.use(IndexServingMiddleware(apiPaths: ["/api"], publicDirectory: rootPath))
    #endif
    app.middleware.use(ErrorMiddleware.default(environment: app.environment))

    app.migrations.add(WorkoutTypeMigration())
    app.migrations.add(UserWorkoutMigration())

    #if DEBUG
      if isMigrating {
        try app.autoMigrate().wait()
      }
    #endif

    app.queues.use(.fluent())
  }
}
