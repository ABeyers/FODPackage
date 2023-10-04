//
// ClientSessionContext.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

#if canImport(WatchConnectivity)
  import WatchConnectivity

  public struct ClientSessionContext {
    enum Field: String {
      case gaClientIdentifier
    }

    public init(applicationContext: [String: Any]) {
      gaClientIdentifier = applicationContext[Field.gaClientIdentifier.rawValue] as? UUID
    }

    public let gaClientIdentifier: UUID?
  }

#endif
