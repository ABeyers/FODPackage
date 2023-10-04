//
// TimingEvent.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

public struct TimingEvent {
  internal init(category: TimingEvent.Category, variable: String) {
    id = UUID()
    self.category = category
    self.variable = variable
  }

  public enum Category: String {
    case userInteraction = "User Interaction"
    case health = "Health"
    case networking = "data update"
  }

  public let id: UUID
  public let category: Category
  public let variable: String

  public enum Networking: TimeEventCategory {
    public static let category: TimingEvent.Category = .networking
    public static let dataUpdate = event(withVariable: "data update")
  }

  public enum Health: TimeEventCategory {
    public static let category: TimingEvent.Category = .health
    public static let metric = event(withVariable: "metric")
  }

  public enum UserInteraction: TimeEventCategory {
    public static let category: TimingEvent.Category = .userInteraction
    public static let starting = event(withVariable: "starting")
  }
}
