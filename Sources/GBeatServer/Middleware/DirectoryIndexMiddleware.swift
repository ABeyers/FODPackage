//
// DirectoryIndexMiddleware.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Fluent
import Vapor

struct DirectoryIndexMiddleware: Middleware {
  /// See `ServiceType`.

  /// The public directory.
  /// - note: Must end with a slash.
  private let fileMiddleware: FileMiddleware
  private let publicDirectory: String

  /// Creates a new `FileMiddleware`.
  public init(publicDirectory: String, fileMiddleware: FileMiddleware? = nil) {
    let publicDirectory = publicDirectory.hasSuffix("/") ? publicDirectory : publicDirectory + "/"
    self.publicDirectory = publicDirectory
    self.fileMiddleware = fileMiddleware ?? FileMiddleware(publicDirectory: publicDirectory)
  }

  func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
    // make a copy of the path

    var path = request.url.path

    // path must be relative.
    while path.hasPrefix("/") {
      path = String(path.dropFirst())
    }

    // protect against relative paths
    guard !path.contains("../") else {
      return request.eventLoop.makeFailedFuture(Abort(.forbidden))
    }

    while path.hasSuffix("/") {
      path = String(path.dropLast())
    }

    // create absolute file path
    let filePath = publicDirectory + path + "/index.html"

    let response: EventLoopFuture<Response>
    // check if file exists and is not a directory
    var isDir: ObjCBool = false
    if FileManager.default.fileExists(atPath: filePath, isDirectory: &isDir), !isDir.boolValue {
      response = request.eventLoop.future(request.fileio.streamFile(at: filePath))
    } else {
      response = fileMiddleware.respond(to: request, chainingTo: next)
    }

    #if DEBUG
      return response.map {
        response in
        response.headers.replaceOrAdd(name: .cacheControl, value: "no-store")
        return response
      }
    #else
      return response
    #endif
  }
}
