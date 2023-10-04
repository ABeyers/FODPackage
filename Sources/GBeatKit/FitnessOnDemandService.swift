//
// FitnessOnDemandService.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
import Prch

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol FitnessOnDemandServiceProtocol: ServiceProtocol where ServiceAPI == FitnessOnDemandAPI {}

public class FitnessOnDemandService<SessionType: Prch.Session>: Service
  where SessionType.ResponseType.DataType == Data, SessionType.RequestDataType == Data {
  public init(session: SessionType, api: FitnessOnDemandAPI) {
    self.session = session
    self.api = api
  }

  public var session: SessionType

  public var api: GBeatKit.FitnessOnDemandAPI

  public typealias ServiceAPI = FitnessOnDemandAPI
}

extension FitnessOnDemandService: FitnessOnDemandServiceProtocol {
  public convenience init(session: SessionType, baseURLComponents: URLComponents) {
    self.init(session: session, api: .init(baseURLComponents: baseURLComponents))
  }

  public convenience init(baseURLComponents: URLComponents, session: URLSession = .shared) where SessionType == URLSession {
    self.init(session: session, baseURLComponents: baseURLComponents)
  }

  public convenience init(api: FitnessOnDemandAPI = .init(), session: URLSession = .shared) where SessionType == URLSession {
    self.init(session: session, api: api)
  }
}
