//
// WatchObject.WorkoutDelegate.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine) && os(watchOS)
  import Combine
  import Foundation

  import FitnessStream

  @available(macOS 11.0, iOS 14.0, watchOS 7.0, *)
  extension WatchObject: WorkoutDelegate {
    func resetWorkout() {
      workout = nil
      data = WorkoutData()
      shortId = ""
      startDate = nil
    }

    public func workout(_ workout: any WorkoutStream, didChangeTo newState: WorkoutState, from _: WorkoutState, atDate _: Date) {
      DispatchQueue.main.async {
        self.workoutState = newState

        if newState == .ended {
          self.resetWorkout()

        } else if let startDate = workout.startDate {
          self.startDate = startDate
        }
      }
    }

    public func workout(_: any WorkoutStream, collected data: WorkoutData) {
      DispatchQueue.main.async {
        self.data = self.data.updated(with: data)
      }
    }

    public func workout(_: any WorkoutStream, failedWith error: WorkoutError) {
      DispatchQueue.main.async {
        self.workoutDelegateError = error
      }
    }
  }
#endif
