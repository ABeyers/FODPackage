//
// CoalescePublicist.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine)
  import Combine
  import Foundation

  public protocol CoalescePublicist {
    func publisher<OutputPublisherA: Publisher, OutputPublisherB: Publisher, OutputPublisherC: Publisher, Output, Failure>(
      fromPublishers publisherA: OutputPublisherA,
      _ publisherB: OutputPublisherB,
      _ publisherC: OutputPublisherC
    ) -> AnyPublisher<Output?, Failure> where
      OutputPublisherA.Output == Output?,
      OutputPublisherB.Output == Output?,
      OutputPublisherC.Output == Output?,
      OutputPublisherA.Failure == Failure,
      OutputPublisherB.Failure == Failure,
      OutputPublisherC.Failure == Failure
  }
#endif
