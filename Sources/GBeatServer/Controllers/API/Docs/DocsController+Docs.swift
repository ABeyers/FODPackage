//
// DocsController+Docs.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FitnessStream
import Foundation
import GBeatKit
import RouteGroups
import Vapor
import VaporOpenAPI

extension APIDocsController {
  struct ShowContext: RouteContext {
    typealias RequestBodyType = EmptyRequestBody

    static let defaultContentType: HTTPMediaType? = nil
    static let shared = Self()

    let success: ResponseContext<String> = .init { response in
      response.headers.contentType = .init(type: "application", subType: "x-yaml")
      response.status = .ok
    }
  }

  struct ViewContext: RouteContext {
    typealias RequestBodyType = EmptyRequestBody

    static let defaultContentType: HTTPMediaType? = nil
    static let shared = Self()

    let success: ResponseContext<String> = .init { response in
      response.headers.contentType = .html
      response.status = .ok
    }
  }
}
