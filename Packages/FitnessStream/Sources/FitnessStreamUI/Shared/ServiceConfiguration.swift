//
// ServiceConfiguration.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
import FitnessStream

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct ServiceConfiguration<CredentialProvider> {
  public init(urlSession: URLSession? = nil, jsonEncoder: JSONEncoder? = nil, jsonDecoder: JSONDecoder? = nil, credentialProvider: CredentialProvider?) {
    self.urlSession = urlSession
    self.jsonEncoder = jsonEncoder
    self.jsonDecoder = jsonDecoder
    self.credentialProvider = credentialProvider
  }
  
//  public static let `default` = ServiceConfiguration(
//    urlSession: nil,
//    jsonEncoder: nil,
//    jsonDecoder: nil,
//    credentialProvider: nil
//  )

  public var urlSession: URLSession?
  public var jsonEncoder: JSONEncoder?
  public var jsonDecoder: JSONDecoder?
  public var credentialProvider: CredentialProvider?
}
