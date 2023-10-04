//
// HealthKitLiveWorkout.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(HealthKit) && !os(macOS) && os(watchOS)
  import HealthKit
import FelinePine

  public extension WorkoutState {
    init(fromHealthKit hkWorkoutSessionState: HKWorkoutSessionState) {
      self.init(rawValue: hkWorkoutSessionState.rawValue)!
    }
  }

public class HealthKitLiveWorkout: NSObject, HKWorkoutSessionDelegate, HKLiveWorkoutBuilderDelegate, WorkoutStream, LoggerCategorized {
  public static var loggingCategory: LoggerCategory {
    return .healthKit
  }
  
  public typealias LoggersType = HeartwitchLoggers
  
    public var startDate: Date? {
      session.startDate
    }

    public func setFullIdentifier(_ joinWorkoutPublicist: Any, _ completion: @escaping (Error?) -> Void) {
      builder.addMetadata(["identifier": joinWorkoutPublicist], completion: Bool.mapTo(completion))
    }

    public func end() {
      Self.logger.debug("Workout ending")
      session.end()
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

    public func workoutSession(_: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
      delegate?.workout(self, didChangeTo: .init(fromHealthKit: toState), from: .init(fromHealthKit: fromState), atDate: date)
    }

    public func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
      dump(error)
      delegate?.workout(self, failedWith: WorkoutError(source: workoutSession, innerError: error, duringEvent: .session))
    }

    public func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder, didCollectDataOf collectedTypes: Set<HKSampleType>) {
      let statistics = collectedTypes.compactMap {
        $0 as? HKQuantityType
      }.compactMap {
        type in
        workoutBuilder.statistics(for: type).map {
          (type, $0)
        }
      }
      let data: [(QuantityType, QuantityValue)] = statistics.compactMap { args in
        let (hkType, quantity) = args
        let type = QuantityType(rawValue: hkType.identifier)
        return (type, quantity)
      }

      let dataBuilder = WorkoutDataBuilder(data: Dictionary(uniqueKeysWithValues: data))
      let result = dataBuilder.result()
      
      Self.logger.debug("Received Health Data")
      Self.logger.debug("Heartrate: \(result.heartRate?.description ?? "")")
      Self.logger.debug("Calories: \(result.activeEnergyBurned?.description ?? "")")
      
      delegate?.workout(self, collected: result)
    }

    public func workoutBuilderDidCollectEvent(_: HKLiveWorkoutBuilder) {}

    public weak var delegate: WorkoutDelegate?
    let session: HKWorkoutSession
    let builder: HKLiveWorkoutBuilder

    init(
      fromHealthStore healthStore: HKHealthStore,
      withConfiguration configuration: HKWorkoutConfiguration
    ) throws {
      session = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)

      // self.workout = Workout(basedOnSession: session)
      builder = session.associatedWorkoutBuilder()
      super.init()
      builder.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore, workoutConfiguration: configuration)
      session.delegate = self
      builder.delegate = self
    }

    public func start() {
      Self.logger.debug("Workout starting")
      session.startActivity(with: Date())
      builder.beginCollection(withStart: Date(), completion: workoutBuildingCollection(didBegin:withError:))
    }

    func workoutBuildingCollection(didBegin _: Bool,
                                   withError error: Error?) {
      if let error = error, let delegate = delegate {
        delegate.workout(self, failedWith: WorkoutError(source: nil, innerError: error, duringEvent: .beginning))
      }
    }
  }
#endif
