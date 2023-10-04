////
//// NetworkStatus.swift
//// Copyright © 2022 Bright Digit, LLC.
//// All Rights Reserved.
//// Created by Leo G Dion.
////
//
//import Foundation
import FitnessStream
import SundialKit
////public enum NetworkStatus: String, CaseIterable {
//////  public struct NetworkDetails {
//////    let interface: NWPathStatus.Interface
//////    let isExpensive: Bool
//////    let isConstrained: Bool
//////  }
////
////  case success
////  case poor
////  case prepared
////  case unauthorized
////  case denied
////  case disconnected
////  case clientFailure
////  case serverFailure
////  case unknownFailure
////}
//
public extension NetworkStatus {
  init(_ pathStatus: PathStatus, _ isExpensive: Bool, _ isConstrained: Bool, _ pingStatus: PingResult?) {
    switch (pathStatus, pingStatus) {
    case (PathStatus.satisfied, .success):
      self = (isExpensive || isConstrained) ? .poor : .success
    case (.satisfied, .unauthorized):
      self = .unauthorized
    case (.requiresConnection, _):
      self = .prepared
    case (.unsatisfied, _):
      self = .denied
    case (_, .clientFailure):
      self = .disconnected
    case (_, .requestFailure):
      self = .clientFailure
    case (.unknown, .none):
      self = .prepared
    case (.unknown, .some(.unauthorized)):
      self = .unauthorized
    case (.unknown, .some(.success)):
      self = .prepared
    case (.satisfied, .none):
      self = .prepared
    case (_, .some(.serverFailure)):
      self = .serverFailure
    case (_, .some(.unknownResponse)):
      self = .unknownFailure
    case (_, .some(.unknownStatusCode)):
      self = .unknownFailure
    }
  }
}
