//
// WatchStatus.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import FitnessStream
import SundialKit

public struct WatchStatus {
  public init(activationState: ActivationState, isAppInstalled: Bool, isPaired: Bool, isReachable: Bool) {
    self.activationState = activationState
    self.isAppInstalled = isAppInstalled
    self.isPaired = isPaired
    self.isReachable = isReachable
  }
  
  public let activationState: ActivationState
  public let isAppInstalled: Bool
  public let isPaired: Bool
  public let isReachable: Bool

  static func activatedConnectivity(basedOn status: WatchStatus) -> WatchConnectivity {
    if status.isReachable {
      return .reachable
    } else if status.isAppInstalled {
      return .installed
    } else if status.isPaired {
      return .session
    } else {
      return .unpaired
    }
  }

  public var connectivity: WatchConnectivity {
    switch activationState {
    case .notActivated:
      return .sessionless
    case .inactive:
      return .inactive
    case .activated:
      return Self.activatedConnectivity(basedOn: self)
    }
  }
}
