//
// ContentEncoder.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Vapor

extension ContentEncoder {
  func encodeBody(_ encodable: some Encodable) throws -> ByteBuffer {
    var body = ByteBuffer()
    var headers = HTTPHeaders()
    try encode(encodable, to: &body, headers: &headers)
    return body
  }
}
