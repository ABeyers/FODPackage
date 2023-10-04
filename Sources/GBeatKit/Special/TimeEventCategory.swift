//
// TimeEventCategory.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

protocol TimeEventCategory {
  static var category: TimingEvent.Category { get }
}

extension TimeEventCategory {
  static func event(withVariable variable: String) -> TimingEvent {
    TimingEvent(category: category, variable: variable)
  }
}
