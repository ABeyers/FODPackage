//
// TimingDelegate.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public protocol TimingDelegate {
  func startTimerFor(_ event: TimingEvent)
  func reportTimerFor(_ event: TimingEvent, withLabel label: String?)
}
