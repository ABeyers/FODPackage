//
// HealthKitWorkout.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(HealthKit)
  import HealthKit

@available(macOS 13.0, *)
public class HealthKitWorkout: NSObject, WorkoutStream {
    public var startDate: Date?

    public func end() {
      builder.endCollection(withEnd: Date()) { _, error in
        if let error = error {
          self.delegate?.workout(self, failedWith: WorkoutError(source: nil, innerError: error, duringEvent: .ending))
          return
        }

        self.builder.finishWorkout { post, error in
          if let error = error {
            self.delegate?.workout(self, failedWith: WorkoutError(source: post, innerError: error, duringEvent: .ending))
          }
        }
      }
    }

    public weak var delegate: WorkoutDelegate?
    let builder: HKWorkoutBuilder

    init(
      fromHealthStore healthStore: HKHealthStore,
      withConfiguration configuration: HKWorkoutConfiguration
    ) throws {
      // self.workout = Workout(basedOnSession: session)
      builder = HKWorkoutBuilder(healthStore: healthStore, configuration: configuration, device: .local())

      super.init()
    }

    public func start() {
      builder.beginCollection(withStart: Date(), completion: workoutBuildingCollection(didBegin:withError:))
    }

    func workoutBuildingCollection(didBegin _: Bool,
                                   withError error: Error?) {
      if let error = error, let delegate = delegate {
        delegate.workout(self, failedWith: WorkoutError(source: nil, innerError: error, duringEvent: .beginning))
      }
    }

    public func setFullIdentifier(_: Any, _ completion: @escaping (Error?) -> Void) {
      completion(nil)
    }
  }
#endif
