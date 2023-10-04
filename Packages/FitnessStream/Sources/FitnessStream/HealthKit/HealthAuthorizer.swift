//
// HealthAuthorizer.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

@available(watchOS 7.0, iOS 14.0, *)
public protocol HealthAuthorizer {
  init(authorization: HealthAuthorizationConfiguration)
  // TODO: Convert to async/await
  func requestAuthorization(_ completed: @escaping (Result<HealthInterface, Error>) -> Void)
}
