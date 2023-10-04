//
// AuthenticationInfo.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
public struct AuthenticationInfo: LosslessStringConvertible, Equatable {
  public static let headerName = "X-HEARTWITCH-IDENTIFICATION"
  public let userID: UUID
  public let deviceIdentifier: UUID

  public init(userID: UUID, deviceIdentifier: UUID) {
    self.userID = userID
    self.deviceIdentifier = deviceIdentifier
  }

  public init?(_ description: String) {
    guard let data = Data(base64Encoded: description) else {
      return nil
    }
    guard data.count == 32 else {
      return nil
    }
    userID = UUID(data: Data(data[0 ... 15]))
    deviceIdentifier = UUID(data: Data(data[16 ... 31]))
  }

  public var description: String {
    let data = Data(Array(uuid: userID) + Array(uuid: deviceIdentifier))
    return data.base64EncodedString()
  }
}
