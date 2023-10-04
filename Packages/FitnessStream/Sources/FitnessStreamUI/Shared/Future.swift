//
//  File.swift
//  
//
//  Created by Leo Dion on 12/10/22.
//

import Foundation
import FitnessStream
#if canImport(Combine)
import Combine
public extension Future {
  convenience init (_ attemptToFulfill: @escaping () async throws -> Output) where Failure == Error {
    self.init { completed in
      Task {
        await completed(Result(catching: attemptToFulfill))
      }
    }
  } 
}
#endif
