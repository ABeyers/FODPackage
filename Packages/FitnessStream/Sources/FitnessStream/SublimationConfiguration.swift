//
//  File.swift
//  
//
//  Created by Leo Dion on 1/5/23.
//

import Foundation

public struct SublimationConfiguration {
  private init?(key: String? = nil, bucketName: String? = nil) {
    let bucketName = bucketName ?? ProcessInfo.processInfo.environment["SUBLIMATION_BUCKET"]
    let key = key ?? ProcessInfo.processInfo.environment["SUBLIMATION_KEY"]
    
    guard let bucketName = bucketName, let key = key else {
      return nil
    }
    
    self.bucketName = bucketName
    self.key = key
    
  }
  
  public static let shared : SublimationConfiguration! = SublimationConfiguration()
  
  public let key : String
  public let bucketName : String
}
#if DEBUG

public enum DeveloperServerError: Error {
    case noServer
    case sublimationError(Error)
  }

#endif
