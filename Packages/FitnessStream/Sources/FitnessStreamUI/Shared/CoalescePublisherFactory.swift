//
// CoalescePublisherFactory.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine)
  import Combine
  import Foundation
import FelinePine

import FitnessStream

  public struct CoalescePublisherFactory: CoalescePublicist, LoggerCategorized {
    public typealias LoggersType = HeartwitchLoggers
    public static var loggingCategory: LoggerCategory {
      return .reactive
    }
    public init() {}
    public func publisher<OutputPublisherA: Publisher, OutputPublisherB: Publisher, OutputPublisherC: Publisher, Output, Failure>(
      fromPublishers publisherA: OutputPublisherA,
      _ publisherB: OutputPublisherB,
      _ publisherC: OutputPublisherC
    ) -> AnyPublisher<Output?, Failure> where
      OutputPublisherA.Output == Output?,
      OutputPublisherB.Output == Output?,
      OutputPublisherC.Output == Output?,
      OutputPublisherA.Failure == Failure,
      OutputPublisherB.Failure == Failure,
      OutputPublisherC.Failure == Failure {
        Publishers.CombineLatest3(publisherA.prepend(nil), publisherB.prepend(nil), publisherC.prepend(nil)).map { valueA, valueB, valueC in
        if let valueA {
          Self.logger.debug("Coalesce - A value")
          return valueA
        } else if let valueB {
          Self.logger.debug("Coalesce - B value")
          return valueB
        } else if let valueC {
          Self.logger.debug("Coalesce - C value")
          return valueC
        } else {
          Self.logger.debug("Coalesce - empty trigger")
          return nil
        }
      }.eraseToAnyPublisher()
    }
  }
#endif
