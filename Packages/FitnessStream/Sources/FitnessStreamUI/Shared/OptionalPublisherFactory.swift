//
// OptionalPublisherFactory.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine)
  import Combine
  import Foundation

  public struct OptionalPublisherFactory: OptionalPublicist {
    public init() {}
    public func publisher<OutputPublisher: Publisher, Output>(
      from publisher: OutputPublisher
    ) -> AnyPublisher<Output?, Never>
      where OutputPublisher.Output == Output {
      publisher.map {
        $0 as Output?
      }.catch { _ in
        Just(nil)
      }.eraseToAnyPublisher()
    }
  }
#endif
