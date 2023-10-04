//
// SampleType.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public protocol SampleType: ObjectType {
  static var sampleMetaType: SampleMetaType { get }
  var sampleRawValue: String? { get }
}

public extension SampleType {
  var objectRawValue: String? {
    sampleRawValue
  }

  static var objectMetaType: ObjectMetaType {
    sampleMetaType
  }
}

public protocol ObjectType {
  var objectRawValue: String? { get }
  static var objectMetaType: ObjectMetaType { get }
}
