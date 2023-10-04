//
// Task.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol SessionTask {}

extension URLSessionDataTask: SessionTask {}
