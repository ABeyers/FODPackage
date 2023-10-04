//
// HealthKitAuthorizer.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(HealthKit)
  import HealthKit

@available(macOS 13.0, *)
public class HealthKitAuthorizer: HealthAuthorizer {
    let authorization: HealthAuthorizationConfiguration
    let store = HKHealthStore()

  public required init(authorization: HealthAuthorizationConfiguration = .default) {
      self.authorization = authorization
    }

    public func requestAuthorization(_ completed: @escaping (Result<HealthInterface, Error>) -> Void) {
      let sharedTypes: Set<HKSampleType> = Set(authorization.sharedTypes.map(\.healthKitSampleType))
      let readTypes: Set<HKObjectType> = Set(authorization.readTypes.map(\.healthKitObjectType))
      store.requestAuthorization(toShare: sharedTypes, read: readTypes) { _, error in
        completed(error.map(Result.failure) ?? Result.success(self.store))
      }
    }
  }
#endif
