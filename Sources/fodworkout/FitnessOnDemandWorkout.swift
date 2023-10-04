//
// FitnessOnDemandWorkout.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
import GBeatKit

@main
enum FitnessOnDemandWorkout {
  static func main() {
    let service = FitnessOnDemandService(baseURLComponents: .init(string: "http://localhost:8080/api/v1")!)

    Task {
      let creationInfo = try await service.request(
        WorkoutCreationRequest(
          body: .init(
            workoutTypeID: 20,
            userID: 12,
            facilityID: 213,
            firstName: "Leo",
            dateOfBirth: .init(timeIntervalSince1970: 0)
          )
        )
      )

      print("workoutID:", creationInfo.id)

      let timer = Timer(fire: .init(), interval: 1.0, repeats: true) { _ in
        Task {
          let listening = try await service.request(
            WorkoutDataUpdateRequest(
              workoutID: creationInfo.id,
              body: .init(heartRate: .random(in: 90 ... 170),
                          activeEnergyBurned: 1)
            )
          )
          print(listening)
        }
      }
      RunLoop.main.add(timer, forMode: .default)
    }
    RunLoop.main.run()
  }
}
