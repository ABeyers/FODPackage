//
// RequestGenerator.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public protocol RequestGenerator {
  associatedtype APIRequestType
  //func updateServer(_ server: Server)
  func request<SessionType: Session, RequestType>(for type: APIRequestType, at server: Server, in session: SessionType)
    throws -> RequestType where SessionType.RequestType == RequestType
}
