//
//  File.swift
//  
//
//  Created by Leo Dion on 1/9/23.
//

#if canImport(Combine)
import Combine

public extension Publisher {
  func noop(_ callback: @escaping (Output) -> Void) -> Publishers.Map<Self, Self.Output> {
    self.map { output in
      callback(output)
      return output
    }
  }
  
  func noopError(_ callback: @escaping (Failure) -> Void) -> Publishers.MapError<Self, Self.Failure> {
    self.mapError { error in
      callback(error)
      return error
    }
  }
}
#endif
