//
// FatalObjectFactory.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine)
  import Combine

  public final class FatalObjectFactory {
    public static var shared: FatalObjectFactory = .init()

    public class ObjectType: ObservableObject {}

    public typealias ConfigurationType = Void
    public func make(withDelegate applicationDelegate: Any, configuration _: ConfigurationType? = nil) -> ObjectType {
      fatalError()
    }
  }
#endif
