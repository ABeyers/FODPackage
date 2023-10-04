//
// PlatformSet.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

protocol PlatformSet {
  @SupportedPlatformBuilder
  var body: any SupportedPlatforms { get }
}
