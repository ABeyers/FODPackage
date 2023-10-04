//
// FailurePublisherFactory.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine)
  import Combine
  import Foundation

  public struct FailurePublisherFactory: FailurePublicist {
    public init() {}
    public func publisher<FailurePublisher: Publisher, Failure>(
      from publisher: FailurePublisher
    ) -> AnyPublisher<Error?, Never> where FailurePublisher.Failure == Failure {
      publisher.map { value -> Failure? in
        value as? Failure
      }.catch {
        Just($0)
      }.eraseToAnyPublisher()
    }
  }

  public struct ResultPublisherFactory: ResultPublicist {
    public init() {}
    public func failure<ResultPublisher: Publisher, SuccessType, FailureType>(
      from publisher: ResultPublisher
    ) -> AnyPublisher<FailureType?, Never> where ResultPublisher.Output == Result<SuccessType, FailureType>, ResultPublisher.Failure == Never {
      publisher.map { value -> FailureType? in
        guard case let .failure(failure) = value else {
          return nil
        }
        return failure
      }.eraseToAnyPublisher()
    }

    public func success<ResultPublisher, SuccessType, FailureType>(from publisher: ResultPublisher) -> AnyPublisher<SuccessType?, Never> where ResultPublisher: Publisher, FailureType: Error, ResultPublisher.Failure == Never, ResultPublisher.Output == Result<SuccessType, FailureType> {
      publisher.map { value -> SuccessType? in
        guard case let .success(failure) = value else {
          return nil
        }
        return failure
      }.eraseToAnyPublisher()
    }
  }
#endif
