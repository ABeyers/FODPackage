//
// ObjectFactory.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine)
  import Foundation

@available(*, deprecated)
  public protocol ObjectFactory {
    associatedtype ConfigurationType
    associatedtype ObjectType: ObservableObject

    func make(configuration: ConfigurationType?) -> ObjectType
    static var shared: Self { get }
  }

public extension ObjectFactory {
    func make() -> ObjectType {
      make(configuration: nil)
    }
  }
#endif
