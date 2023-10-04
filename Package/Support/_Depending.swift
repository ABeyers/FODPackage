//
// _Depending.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

protocol _Depending {
  @DependencyBuilder
  var dependencies: any Dependencies { get }
}

extension _Depending {
  var dependencies: any Dependencies {
    [Dependency]()
  }
}

extension _Depending {
  func allDependencies() -> [Dependency] {
    dependencies.compactMap {
      $0 as? _Depending
    }.flatMap {
      $0.allDependencies()
    }.appending(dependencies)
  }
}
