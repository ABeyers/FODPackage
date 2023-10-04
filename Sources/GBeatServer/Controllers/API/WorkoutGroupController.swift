//
// WorkoutGroupController.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FitnessStream
import FluentPostgresDriver
import Foundation
import GBeatKit
import Redis
import RediStack
import RouteGroups
import Vapor
import VaporOpenAPI

struct UserData: Codable {
  internal init(dateOfBirth: Date, displayName: String) {
    self.dateOfBirth = dateOfBirth
    self.displayName = displayName
  }

  let dateOfBirth: Date
  let displayName: String
}

struct WorkoutGroupController {
  func create(request: TypedRequest<CreateWorkoutGroupContext>) async throws -> WorkoutGroupCreateResponseContent {
    let createRequest = try request.decodeBody()
    let userData = UserData(dateOfBirth: createRequest.dateOfBirth, displayName: createRequest.firstName)

    try await request.application.redis.set("userID-\(createRequest.userID)", toJSON: userData)
    let userModel = try await UserWorkoutModel.create(on: request.db, content: createRequest)
    let id = try userModel.requireID()
    return .init(id: id)
  }

  func beginListenWS(_ req: TypedRequest<ObserveWorkoutGroupContext>) async throws -> Vapor.Response {
    guard
      let facilityID = req.parameters.get("facilityID", as: Int.self)
    else {
      throw Abort(.unauthorized)
    }

    return req.underlyingRequest.webSocket { req, websocket in
      req.application.webSockets.save(websocket, withID: facilityID)
    }
  }

  func push(_ req: TypedRequest<PushWorkoutDataContext>) async throws -> HTTPStatus {
    let userModelWorkoutID = try req.parameters.require("id", as: UUID.self)

    let workoutData = try req.decodeBody()

    guard let userWorkout = try await UserWorkoutModel.find(userModelWorkoutID, on: req.db) else {
      throw Abort(.notFound)
    }

    let userData = try await req.application.redis.get("userID-\(userWorkout.userID)", asJSON: UserData.self) ?? .init(dateOfBirth: .init(timeIntervalSince1970: 0), displayName: "")

    let message = WorkoutWebsocketMessage(
      heartRate: workoutData.heartRate,
      activeEnergyBurned: workoutData.activeEnergyBurned,
      userId: userWorkout.userID,
      displayName: userData.displayName,
      dateOfBirth: userData.dateOfBirth
    )

    let buffer = try ContentConfiguration.global.requireEncoder(for: .json).encodeBody(message)

    let text = String(buffer: buffer)
    let wasSent = req.application.webSockets.sendText(text, toWebSocketId: userWorkout.facilityID)

    try await userWorkout.save(on: req.db)
    return wasSent ? .accepted : .noContent
  }
}

extension WorkoutGroupController: RouteGroupCollection {
  var routeGroups: [RouteGroupKey: RouteGroups.RouteCollectionBuilder] {
    var routeGroups = [RouteGroupKey: RouteCollectionBuilder]()

    routeGroups[.publicAPI] = { routes in
      routes.post("workouts", use: self.create(request:))
        .description("Creates an ID to push the workout to.")
        .tags("Active Workout")
      routes.put(
        "workouts",
        .parameter("id", type: UserWorkoutModel.IDValue.self).description("The ID of the user's workout to emit your user's heartbeat to."),
        use: self.push(_:)
      )
      .description("Pushes a heartbeat for your user to the specified workout group.")
      .tags("Active Workout")
      routes.get(
        "workouts",
        .parameter("facilityID", type: Int.self).description("The ID of the facility to observe"),
        "listen",
        use: self.beginListenWS
      )
      .description("Begins listening for updates to heart rates in the specified workout group. Uses a WebSocket connection.")
      .tags("Authenticated", "Workout Groups", "Active Workout")
    }

    return routeGroups
  }

  typealias RouteGroupKeyType = RouteGroupKey
}
