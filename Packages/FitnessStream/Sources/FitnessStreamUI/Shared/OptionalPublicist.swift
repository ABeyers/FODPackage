//
// OptionalPublicist.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine)
  import Combine
  import Foundation

  public protocol OptionalPublicist {
    func publisher<OutputPublisher: Publisher, Output>(
      from publisher: OutputPublisher
    ) -> AnyPublisher<Output?, Never> where OutputPublisher.Output == Output
  }
#endif
