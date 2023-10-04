//
// APIDocsController.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
import RouteGroups
import Vapor
import VaporOpenAPI
import Yams

struct APIDocsController: RouteGroupCollection {
  var routeGroups: [RouteGroupKey: RouteGroups.RouteCollectionBuilder] {
    [
      .publicAPI: { routes in
        routes.get("docs", use: view)
        routes.get("docs", "openapi.yml", use: show)
      }
    ]
  }

  typealias RouteGroupKeyType = RouteGroupKey

  let app: Application

  init(app: Application) {
    self.app = app
  }

  func view(_ req: TypedRequest<ViewContext>) async throws -> Response {
    let html =
      """
      <!DOCTYPE html>
      <html>
        <head>
          <title>ReDoc</title>
          <!-- needed for adaptive design -->
          <meta charset="utf-8"/>
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,700|Roboto:300,400,700" rel="stylesheet">
          <!--
          ReDoc doesn't change outer page styles
          -->
          <style>
            body {
              margin: 0;
              padding: 0;
            }
          </style>
        </head>
        <body>
          <redoc spec-url='/api/v1/docs/openapi.yml'></redoc>
          <script src="https://cdn.jsdelivr.net/npm/redoc@next/bundles/redoc.standalone.js"> </script>
        </body>
      </html>
      """

    return try await req.response.success.encode(html)
  }

  func show(_ req: TypedRequest<ShowContext>) async throws -> Response {
    let jsonEncoder = JSONEncoder.default
    jsonEncoder.outputFormatting = .sortedKeys

    let info = OpenAPI.Document.Info(
      title: "gBeat API",
      description: "The gBeat API",
      version: "1.0"
    )

    let servers = [
      OpenAPI.Server(url: URL(string: "https://gbeat.com")!)
    ]

    let paths = try app.routes.openAPIPathItems(using: jsonEncoder)

    let document = OpenAPI.Document(
      info: info,
      servers: servers,
      paths: paths,
      components: .noComponents,
      security: []
    )

    return try await req
      .response
      .success
      .encode(YAMLEncoder().encode(document))
  }
}
