//
// PhoneSampleView.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(HealthKit) && os(iOS)
  import Combine
  import FitnessStream
  import FitnessStreamUI
  import GBeatKit
  import HealthKit
  import SundialKit
  import SwiftUI

  extension ActivationState: CustomStringConvertible {
    public var description: String {
      switch self {
      case .activated: return "activated"
      case .inactive: return "inactive"
      case .notActivated: return "notActivated"
      }
    }
  }

  public class WorkoutStatusObject: ObservableObject {
    let authorizer = HealthKitAuthorizer()
    let wcObject = ConnectivityObserver()

    @Published var healthInterface: HealthInterface?
    @Published var error: Error?
    @Published var state: ActivationState = .notActivated

    let errorSubject = PassthroughSubject<Error, Never>()
    let healthInterfaceResultSubject = PassthroughSubject<Result<HealthInterface, Error>, Never>()
    let workoutInfoSubject = PassthroughSubject<WorkoutInfo, Never>()

    var cancellables = [AnyCancellable]()

    var canStart: Bool {
      healthInterface != nil
    }

   public init(healthInterface: HealthInterface? = nil, error: Error? = nil) {
      self.healthInterface = healthInterface
      self.error = error

      wcObject.activationStatePublisher.receive(on: DispatchQueue.main).assign(to: &$state)

      let hiTuple = healthInterfaceResultSubject.map { result -> (HealthInterface?, Error?) in
        switch result {
        case let .success(interface):
          return (interface, nil)
        case let .failure(error):
          return (nil, error)
        }
      }.share()

      hiTuple.compactMap(\.0).map(Optional.some).receive(on: DispatchQueue.main).assign(to: &self.$healthInterface)

      Publishers.Merge(
        hiTuple.compactMap(\.1),
        errorSubject
      )
      .map(Optional.init).receive(on: DispatchQueue.main).assign(to: &self.$error)

      let sharedWorkoutInfo = workoutInfoSubject.compactMap { $0 }.share()

      let appStarted = sharedWorkoutInfo.compactMap { info -> ActivityType? in
        guard let type = ActivityType(fromComponents: info) else {
          assertionFailure()
          return nil
        }
        return type
      }.compactMap { type -> (HealthInterface, ActivityType)? in
        guard let healthInterface = self.healthInterface else {
          assertionFailure()
          return nil
        }
        return (healthInterface, type)
      }.flatMap { tuple in
        Future { closure in
          Task { @MainActor in
            do {
              debugPrint("start watch app")
              try await tuple.0.startWatchApp(withActivity: tuple.1)
              closure(.success(()))
              return ()
            } catch {
              self.errorSubject.send(error)
            }
            closure(.success(nil))
          }
        }.compactMap { $0 }
      }.sink { _ in }.store(in: &cancellables)

      wcObject.isReachablePublisher.combineLatest(sharedWorkoutInfo) { isReachable, workoutInfo -> WorkoutInfo? in
        guard isReachable else {
          return nil
        }
        return workoutInfo
      }.compactMap { $0?.message() }.print().subscribe(wcObject.sendingMessageSubject).store(in: &cancellables)
     
    }

    func begin() {
      do {
        try wcObject.activate()
      } catch {
        errorSubject.send(error)
        return
      }

      authorizer.requestAuthorization { result in
        self.healthInterfaceResultSubject.send(result)
      }
    }

    func startWorkout(info: WorkoutInfo) -> ActivationState {
      workoutInfoSubject.send(info)
      return state
    }
    
    func leaveFacility() {
      wcObject.sendingMessageSubject.send(["facilityLeft": true])
    }
  }

  public struct PhoneSampleView: View {
    @State var presentingError: Bool = false
    @ObservedObject var object = WorkoutStatusObject()
    @State var info = WorkoutInfo(displayName: "", userId: .random(in: 100 ... 1000), age: 0, facilityId: 0, facilityName: "", activityTypeId: ActivityTypeId.functionalStrengthTraining.rawValue, activityName: "")
    public init() {}

    public var body: some View {
      VStack {
        HStack {
          Text("\(self.object.state.description)")
        }
        HStack {
          Text("Name")
          TextField(
            "User name",
            text: $info.displayName
          )
        }
        HStack {
          Text("Age")
          if #available(iOS 15.0, *) {
            TextField(
              "Age",
              value: $info.age,
              format: .number
            )
          } else {
            TextField("Age", value: $info.age, formatter: NumberFormatter())
          }
        }
        HStack {
          Text("Facility ID")
          if #available(iOS 15.0, *) {
            TextField(
              "ID",
              value: $info.facilityId,
              format: .number
            )
          } else {
            TextField("ID", value: $info.facilityId, formatter: NumberFormatter())
            // Fallback on earlier versions
          }
        }
        HStack {
          Text("Facility Name")
          TextField(
            "Name",
            text: $info.facilityName
          )
        }
        HStack {
          Text("Activity Name")
          TextField(
            "Workout Name",
            text: $info.activityName
          )
        }
        HStack {
          Text("Activity Type ID")
          if #available(iOS 15.0, *) {
            TextField(
              "ID",
              value: $info.activityTypeId,
              format: .number
            )
          } else {
            TextField("ID", value: $info.activityTypeId, formatter: NumberFormatter())
            // Fallback on earlier versions
          }
        }
        Button("start") {
//          self.object.startWorkout(info)
        }.disabled(self.object.healthInterface == nil)
        Button("Leave Facility") {
          self.object.wcObject.sendingMessageSubject.send(["facilityLeft": true])
        }
        Spacer()
      }.onAppear {
        // swiftlint:disable:next force_try
        self.object.begin()
      }
//      .alert("Error", isPresented: self.$presentingError, presenting: self.object.$error, actions: { error in
//        Text("Help")
//      })
      .padding()
    }
  }

#endif
