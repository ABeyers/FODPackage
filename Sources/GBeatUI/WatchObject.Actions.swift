//
// WatchObject.Actions.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine) && os(watchOS)
  import Combine
  import Foundation

  @available(macOS 11.0, iOS 14.0, watchOS 7.0, *)
  public extension WatchObject {
    func beginHealthAuthorization() {
      if case .success = healthInterfaceResult {
        return
      }
      healthRepository.requestAuthorization { result in
        DispatchQueue.main.async {
          self.healthInterfaceResult = result
        }
      }
    }

    func startWorkout() {
      startWorkoutSubject.send()
    }

    func endWorkout() {
      assert(busyState == nil)
      endWorkoutSubject.send()
    }

    func leaveFacility() {
      leaveFacilitySubject.send()
    }

    func resetErrors() {
      DispatchQueue.main.async {
        self.workoutDelegateError = nil
      }
    }
  }

#endif
