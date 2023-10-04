//
//  File.swift
//  
//
//  Created by Leo Dion on 1/9/23.
//

import Foundation


public extension Result {
  init (catching: () async throws -> Success) async where Failure == Error {
    do {
      self = try await .success(catching())
    } catch {
      self = .failure(error)
    }
  }
}

