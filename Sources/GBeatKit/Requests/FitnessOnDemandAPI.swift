//
// FitnessOnDemandAPI.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation
import PrchModel

extension FitnessOnDemandAPI {
  enum Defaults {
    internal static let encoder: any Encoder<Data> = JSONEncoder.default

    internal static let decoder: any Decoder<Data> = JSONDecoder.default

    internal static let headers: [String: String] =
      ["Content-Type": "application/json; charset=utf-8"]
  }
}

public final class FitnessOnDemandAPI: API {
  public init(baseURLComponents: URLComponents = .init(string: "https://fod-leaderboard-ee074068b25c.herokuapp.com/api/v1")!) {
    self.baseURLComponents = baseURLComponents
  }

  public var encoder: any Encoder<Data> {
    Defaults.encoder
  }

  public var decoder: any Decoder<Data> {
    Defaults.decoder
  }

  public typealias RequestDataType = Data

  public typealias ResponseDataType = Data

  public var baseURLComponents: URLComponents = .init(string: "https://fod-leaderboard-ee074068b25c.herokuapp.com/api/v1")!

  public var headers: [String: String] {
    Defaults.headers
  }
}
