//
// WatchObject.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FitnessStream
import FitnessStreamUI
import GBeatKit
import Prch
import PrchModel
import SundialKit

extension MessageDecoder {
  static let `default` = MessageDecoder(messagableTypes: [StartWorkoutMessage<Int>.self, EndWorkoutMessage.self, WorkoutStatusQuery.self, WorkoutInfo.self])
}

#if canImport(Combine) && os(watchOS)

  import Combine
  import FelinePine
  import FitnessStream
  import FitnessStreamUI
  import Foundation
  import HealthKit
  import SwiftUI
  import UserNotifications
  import WatchKit

  extension WorkoutGroupRequestContent {
    init(workoutInfo: WorkoutInfo) {
      self.init(workoutTypeID: workoutInfo.activityTypeId, userID: workoutInfo.userId, facilityID: workoutInfo.facilityId, firstName: workoutInfo.displayName, dateOfBirth: workoutInfo.dateOfBirth)
    }
  }

  public struct WorkoutActivationData {
    internal init?(_ tuple: (WorkoutInfo?, HKWorkoutConfiguration?)) {
      guard let workoutInfo = tuple.0 else {
        print("No Workout Info")
        return nil
      }

      guard let activityType = ActivityType(fromComponents: workoutInfo) ??
        tuple.1.flatMap({
          ActivityType(fromComponents: HealthKitActvityTypeComponents(activityType: $0.activityType))
        })

      else {
        print("No Activity Type")
        dump(tuple)
        return nil
      }

      self.init(workoutInfo: workoutInfo, activityType: activityType, configuration: tuple.1)
    }

    internal init(workoutInfo: WorkoutInfo, activityType: ActivityType, configuration: HKWorkoutConfiguration?) {
      self.configuration = configuration
      self.workoutInfo = workoutInfo
      self.activityType = activityType
    }

    public let configuration: HKWorkoutConfiguration?
    public let workoutInfo: WorkoutInfo
    public let activityType: ActivityType
  }

  public struct WorkoutGroupResponseContent {
    let name: String
    let instructorName: String
  }

  @available(OSX 11.0, iOS 14.0, watchOS 7.0, *)
  public class WatchObject: ObservableObject, LoggerCategorized {
    public typealias LoggersType = HeartwitchLoggers

    public static var loggingCategory: LoggerCategory {
      .reactive
    }

    public let healthRepository: HealthAuthorizer
    // @Published public var service: GBService?
    public let service: any FitnessOnDemandServiceProtocol

    let messageSendingSubject = PassthroughSubject<Messagable, Never>()
    let messagesRecievedSubject = PassthroughSubject<Messagable, Never>()

    let workoutChangeFactory: WorkoutChangeFactoryProtocol =
      WorkoutChangeFactory()
    let workoutFactory: WorkoutFactoryProtocol = WorkoutFactory()

    public var cancellables = [AnyCancellable]()
    public var endWorkoutSubject = PassthroughSubject<Void, Never>()
    public var startWorkoutSubject = PassthroughSubject<Void, Never>()
    public var leaveFacilitySubject = PassthroughSubject<Void, Never>()

    @Published public var workoutCreateData: (HealthInterface, ActivityType)?

    @Published public var dataUpdateStatus: Result<SocketStatus, Error>?
    @Published public var workoutID: UUID?
    @Published public var workoutInfo: WorkoutInfo?
    @Published public var atFacility = false
    @Published public var facilityLeft = false
    @Published public var servers: [Server] = Server.Defaults.all
    @Published public var selectedServer: Server? // = Server.Defaults.production
    @Published public var isInvalidCode: Bool = false
    @Published public var isListened: Bool?
    @Published public var data = WorkoutData()
    @Published public var shortId: String = ""
    @Published public var joinWorkoutSetup: WorkoutGroupResponseContent?
    @Published public var healthInterfaceResult: Result<HealthInterface, Error>?
    @Published public var workout: (any WorkoutStream)?
    @Published public var busyState: WorkoutBusyState?
    @Published public var startDate: Date?
    @Published public var dateOfBirth: Date?
    @Published public var token: String?
//    @Published public var profile: UserProfile?
    @Published public var elapsed: TimeInterval?
    @Published public var activationData: WorkoutActivationData?
    @Published public var workoutConfiguration: HKWorkoutConfiguration?

    public let isBetaRelase = false
    @Published public var displayWorkoutError: Bool = false

    // Watch Connectivity to Phone

    @Published var lastWorkoutIDReceived: Int = 0
    @Published var lastWorkoutIDSent: Int = 0
    @Published var lastWorkoutIDReply: Int = 0
    @Published var wcObject = ConnectivityObserver()

    @Published var isReachable = false
    @Published var isCompanionAppInstalled = false
    @Published var activationState = ActivationState.notActivated
    @Published var lastError: Error?

    @Published public var workoutState: WorkoutState = .none

    // Errors
    @Published public var healthError: Error?
    @Published public var activityError: Error?
    @Published public var workoutStartError: Error?
    @Published public var metadataError: Error?
    internal var timers = [UUID: Date]()
    @Published var workoutDelegateError: Error?

    public init(applicationDelegate: AppDelegate,
                healthRepository: HealthAuthorizer = HealthKitAuthorizer()) {
      service = FitnessOnDemandService()
      self.healthRepository = healthRepository

      endWorkoutSubject.receive(on: DispatchQueue.main)
        .sink {
          print("Start Clearing Workout")

          guard let workout = self.workout else {
            assert(self.workout != nil)
            return
          }

          self.workout = nil
          workout.end()
          print("Done Clearing Workout")
        }.store(in: &cancellables)

      leaveFacilitySubject.receive(on: DispatchQueue.main)
        .sink {
          print("Start Leaving Facility")
          self.activationData = nil
          self.workoutInfo = nil
          applicationDelegate.workoutConfiguration = nil
          self.atFacility = false
          self.facilityLeft = false

          guard let workout = self.workout else {
            return
          }

          self.workout = nil
          workout.end()
          print("Done Leaving Facility")
        }.store(in: &cancellables)

      $healthInterfaceResult.map {
        try? $0?.get().dateOfBirthComponents()
      }.map {
        $0.flatMap(Calendar.current.date(from:))
      }.receive(on: DispatchQueue.main).assign(to: &$dateOfBirth)

      applicationDelegate.$workoutConfiguration.share().receive(on: DispatchQueue.main).assign(to: &$workoutConfiguration)
      applicationDelegate.$launchedFromPhone.share().receive(on: DispatchQueue.main).assign(to: &$atFacility)

      Publishers.CombineLatest($workoutInfo, applicationDelegate.$workoutConfiguration)
        .print("new workout info")
        .compactMap { actDataInput in
          WorkoutActivationData(actDataInput)
        }
        .map {
          $0 as WorkoutActivationData
        }
        .receive(on: DispatchQueue.main)
        .assign(to: &$activationData)

      let workoutDepsPublisher = Publishers.CombineLatest($activationData, $healthInterfaceResult)
        .tryCompactMap { activationData, healthInterfaceResult -> WorkoutDependencies? in

          guard let activityType = activationData?.activityType else {
            print("No Activation Type")
            return nil
          }
          guard let healthInterface = try healthInterfaceResult?.get() else {
            print("No HealthInterface")
            return nil
          }
          return (healthInterface, activityType)
        }

      workoutDepsPublisher.assertNoFailure().receive(on: DispatchQueue.main).sink(receiveValue: { dependencies in
        self.workoutCreateData = dependencies
      }).store(in: &cancellables)

      // listen for start workout tap

      $workoutCreateData.combineLatest(startWorkoutSubject).receive(on: DispatchQueue.main).sink(receiveValue: { dependencies in
        if dependencies == nil {
          self.busyState = .starting
        } else {
          self.busyState = nil
          guard self.workout == nil, let wCData = self.workoutCreateData else {
            return
          }
          print("Start workout \(wCData)")
          do {
            let workout = try self.workoutFactory.startWorkout(basedOn: wCData, using: self)
            workout.start()
            self.workout = workout

          } catch {
            self.workoutStartError = error
          }
        }
      }).store(in: &cancellables)

      $workout.compactMap { $0 }.flatMap { _ in

        Future {
          guard let workoutInfo = self.workoutInfo else {
            assertionFailure()
            throw NSError()
          }
          return try await self.service.request(
            WorkoutCreationRequest(
              body: .init(workoutInfo: workoutInfo)
            ))
        }
      }
      .map(\WorkoutGroupCreateResponseContent.id)
      .print()
      .map(Optional.some)
      .replaceError(with: .none)
      .assign(to: &$workoutID)

      $workoutID.compactMap { $0 }.combineLatest($data).flatMap {
        let request = WorkoutDataUpdateRequest(workoutID: $0.0, body: $0.1)
        return Future {
          try await self.service.request(request)
        }
      }
      .map(Result.success)
      .catch {
        Just(.failure($0))
      }
      .print()
      .assign(to: &$dataUpdateStatus)

      $workoutDelegateError.map {
        $0 != nil
      }.receive(on: DispatchQueue.main).assign(to: &$displayWorkoutError)

      $startDate
        .compactMap { $0 }
        .map { startDateTime in
          Timer
            .publish(every: 1.0, on: .main, in: .default)
            .autoconnect()
            .map { _ in (startDateTime.timeIntervalSinceNow * -1.0) as TimeInterval? }
        }.switchToLatest()
        .receive(on: DispatchQueue.main)
        .assign(to: &$elapsed)

      wcObject.activationStatePublisher.compactMap { status in
        guard status == .activated else {
          return nil
        }
        return WorkoutStatusMessage(status: self.workoutState)
      }.subscribe(messageSendingSubject).store(in: &cancellables)

      wcObject.isReachablePublisher.receive(on: DispatchQueue.main).assign(to: &$isReachable)

      wcObject.isPairedAppInstalledPublisher.receive(on: DispatchQueue.main).assign(to: &$isCompanionAppInstalled)

      messageSendingSubject.map { $0.message() }.subscribe(wcObject.sendingMessageSubject).store(in: &cancellables)

      $workoutState.map(WorkoutStatusMessage.init(status:)).subscribe(messageSendingSubject).store(in: &cancellables)

      let endWorkoutMessagePublisher = messagesRecievedSubject.share().compactMap { $0 as? EndWorkoutMessage }

      messagesRecievedSubject.share().compactMap {
        $0 as? WorkoutInfo
      }.receive(on: DispatchQueue.main).assign(to: &$workoutInfo)

      wcObject.messageReceivedPublisher
        .compactMap { received in
          received.message["facilityLeft"] as? Bool
        }.receive(on: DispatchQueue.main).assign(to: &$facilityLeft)

      wcObject.messageReceivedPublisher.compactMap { result in
        MessageDecoder.default.decode(result.message)
      }.subscribe(messagesRecievedSubject).store(in: &cancellables)

      do {
        try wcObject.activate()
      } catch {
        Self.logger.debug("Skipping SIWA Verification...")
      }

      $facilityLeft.sink { val in
        if val {
          self.leaveFacility()
        }
      }.store(in: &cancellables)

      wcObject.activationStatePublisher.sink { state in
        self.activationState = state
        Self.logger.debug("Activation State: \(state.rawValue)")
      }.store(in: &cancellables)

      #if DEBUG
        if let activityTypeId = ProcessInfo.processInfo.environment["activationTypeID"].flatMap(Int.init) {
          let workoutInfo = WorkoutInfo(
            displayName: "John Doe",
            userId: 12,
            dateOfBirth: .init(timeIntervalSince1970: 0),
            facilityId: 213,
            facilityName: "Anywhere",
            activityTypeId: activityTypeId,
            activityName: "Running"
          )
          self.workoutInfo = workoutInfo
        }
      #endif
    }

    #if targetEnvironment(simulator) && DEBUG
      func setDateOfBirth() {
        dateOfBirth = Date()
      }
    #endif

    deinit {
      cancellables.forEach { cancellable in
        cancellable.cancel()
      }
      cancellables.removeAll()
    }
  }

#endif
