//
// Factory.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public struct Factory<ConfigurationType: DefaultConfigurable, ObjectType> {
  public let configuration: ConfigurationType
  public let factory: (ConfigurationType) -> ObjectType

  public init(configurationType _: ConfigurationType.Type, factory: @escaping ((ConfigurationType) -> ObjectType)) {
    configuration = ConfigurationType.default
    self.factory = factory
  }

  public func make() -> ObjectType {
    factory(configuration)
  }
}
