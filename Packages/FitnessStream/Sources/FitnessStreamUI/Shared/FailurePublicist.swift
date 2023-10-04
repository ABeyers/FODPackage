//
// FailurePublicist.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine)
  import Combine
  import Foundation
  public protocol FailurePublicist {
    func publisher<FailurePublisher: Publisher, Failure>(
      from publisher: FailurePublisher
    ) -> AnyPublisher<Error?, Never>
      where FailurePublisher.Failure == Failure
  }

  public protocol ResultPublicist {
    func failure<ResultPublisher: Publisher, SuccessType, FailureType>(
      from publisher: ResultPublisher
    ) -> AnyPublisher<FailureType?, Never> where ResultPublisher.Output == Result<SuccessType, FailureType>, ResultPublisher.Failure == Never

    func success<ResultPublisher: Publisher, SuccessType, FailureType>(
      from publisher: ResultPublisher
    ) -> AnyPublisher<SuccessType?, Never> where ResultPublisher.Output == Result<SuccessType, FailureType>, ResultPublisher.Failure == Never
  }

#endif
