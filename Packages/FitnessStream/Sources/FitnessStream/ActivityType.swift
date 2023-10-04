//
// ActivityType.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public struct ActivityType: CustomStringConvertible, Identifiable, Hashable, Codable {
  public let id: ActivityTypeId
  public let description: String
  public let isPopular: Bool
  
  

  public init?(fromComponents activityTypeComponents: ActivityTypeComponents) {
    guard let id = activityTypeComponents.rawValue.flatMap(ActivityTypeId.init(rawValue:)) else {
      return nil
    }
    self.id = id
    description = activityTypeComponents.description
    isPopular = activityTypeComponents.isPopular
  }

  private init(id: ActivityTypeId, description: String, isPopular: Bool = false) {
    self.id = id
    self.description = description
    self.isPopular = isPopular
  }

  public static func tryFrom(rawValue: ActivityTypeId.RawValue) throws -> Self {
    guard let index = rawValueMap[rawValue] else {
      throw InternalError.invalidActivityTypeValue(rawValue)
    }

    return Self.all[index]
  }

  public static func from(rawValue: ActivityTypeId.RawValue) -> Self {
    guard let index = rawValueMap[rawValue] else {
      preconditionFailure()
    }

    return Self.all[index]
  }

  public static let americanFootball = ActivityType(id: .americanFootball, description: "American Football")
  public static let archery = ActivityType(id: .archery, description: "Archery")
  public static let australianFootball = ActivityType(id: .australianFootball, description: "Australian Football")
  public static let badminton = ActivityType(id: .badminton, description: "Badminton")
  public static let barre = ActivityType(id: .barre, description: "Barre", isPopular: true)
  public static let baseball = ActivityType(id: .baseball, description: "Baseball")
  public static let basketball = ActivityType(id: .basketball, description: "Basketball")
  public static let bowling = ActivityType(id: .bowling, description: "Bowling")
  public static let boxing = ActivityType(id: .boxing, description: "Boxing")
  public static let climbing = ActivityType(id: .climbing, description: "Climbing")
  public static let coreTraining = ActivityType(id: .coreTraining, description: "Core Training")
  public static let cricket = ActivityType(id: .cricket, description: "Cricket")
  public static let crossCountrySkiing = ActivityType(id: .crossCountrySkiing, description: "Cross Country Skiing")
  public static let crossTraining = ActivityType(id: .crossTraining, description: "Cross Training")
  public static let curling = ActivityType(id: .curling, description: "Curling")
  public static let cycling = ActivityType(id: .cycling, description: "Cycling", isPopular: true)
  public static let dance = ActivityType(id: .dance, description: "Dance")
  public static let discSports = ActivityType(id: .discSports, description: "Disc Sports")
  public static let downhillSkiing = ActivityType(id: .downhillSkiing, description: "Downhill Skiing")
  public static let elliptical = ActivityType(id: .elliptical, description: "Elliptical")
  public static let equestrianSports = ActivityType(id: .equestrianSports, description: "Equestrian Sports")
  public static let fencing = ActivityType(id: .fencing, description: "Fencing")
  public static let fishing = ActivityType(id: .fishing, description: "Fishing")
  public static let fitnessGaming = ActivityType(id: .fitnessGaming, description: "Fitness Gaming")
  public static let flexibility = ActivityType(id: .flexibility, description: "Flexibility")
  public static let functionalStrengthTraining = ActivityType(id: .functionalStrengthTraining, description: "Functional Strength Training", isPopular: true)
  public static let golf = ActivityType(id: .golf, description: "Golf")
  public static let gymnastics = ActivityType(id: .gymnastics, description: "Gymnastics")
  public static let handball = ActivityType(id: .handball, description: "Hand Cycling")
  public static let handCycling = ActivityType(id: .handCycling, description: "Handball")
  public static let highIntensityIntervalTraining = ActivityType(id: .highIntensityIntervalTraining, description: "High Intensity Interval Training", isPopular: true)
  public static let hiking = ActivityType(id: .hiking, description: "Hiking")
  public static let hockey = ActivityType(id: .hockey, description: "Hockey")
  public static let hunting = ActivityType(id: .hunting, description: "Hunting")
  public static let jumpRope = ActivityType(id: .jumpRope, description: "Jump Rope")
  public static let kickboxing = ActivityType(id: .kickboxing, description: "Kickboxing")
  public static let lacrosse = ActivityType(id: .lacrosse, description: "Lacrosse")
  public static let martialArts = ActivityType(id: .martialArts, description: "Martial Arts")
  public static let mindAndBody = ActivityType(id: .mindAndBody, description: "Mind And Body")
  public static let mixedCardio = ActivityType(id: .mixedCardio, description: "Mixed Cardio", isPopular: true)
  public static let other = ActivityType(id: .other, description: "Other")
  public static let paddleSports = ActivityType(id: .paddleSports, description: "Paddle Sports")
  public static let pilates = ActivityType(id: .pilates, description: "Pilates")
  public static let play = ActivityType(id: .play, description: "Play")
  public static let preparationAndRecovery = ActivityType(id: .preparationAndRecovery, description: "Preparation And Recovery")
  public static let racquetball = ActivityType(id: .racquetball, description: "Racquetball")
  public static let rowing = ActivityType(id: .rowing, description: "Rowing")
  public static let rugby = ActivityType(id: .rugby, description: "Rugby")
  public static let running = ActivityType(id: .running, description: "Running")
  public static let sailing = ActivityType(id: .sailing, description: "Sailing")
  public static let skatingSports = ActivityType(id: .skatingSports, description: "Skating Sports")
  public static let snowboarding = ActivityType(id: .snowboarding, description: "Snow Sports")
  public static let snowSports = ActivityType(id: .snowSports, description: "Snowboarding")
  public static let soccer = ActivityType(id: .soccer, description: "Soccer")
  public static let softball = ActivityType(id: .softball, description: "Softball")
  public static let squash = ActivityType(id: .squash, description: "Squash")
  public static let stairClimbing = ActivityType(id: .stairClimbing, description: "Stair Climbing")
  public static let stairs = ActivityType(id: .stairs, description: "Stairs")
  public static let stepTraining = ActivityType(id: .stepTraining, description: "Step Training")
  public static let surfingSports = ActivityType(id: .surfingSports, description: "Surfing Sports")
  public static let swimming = ActivityType(id: .swimming, description: "Swimming")
  public static let tableTennis = ActivityType(id: .tableTennis, description: "Table Tennis")
  public static let taiChi = ActivityType(id: .taiChi, description: "Tai Chi")
  public static let tennis = ActivityType(id: .tennis, description: "Tennis")
  public static let trackAndField = ActivityType(id: .trackAndField, description: "Track And Field")
  public static let traditionalStrengthTraining = ActivityType(id: .traditionalStrengthTraining, description: "Traditional Strength Training")
  public static let volleyball = ActivityType(id: .volleyball, description: "Volleyball")
  public static let walking = ActivityType(id: .walking, description: "Walking")
  public static let waterFitness = ActivityType(id: .waterFitness, description: "Water Fitness")
  public static let waterPolo = ActivityType(id: .waterPolo, description: "Water Polo")
  public static let waterSports = ActivityType(id: .waterSports, description: "Water Sports")
  public static let wheelchairRunPace = ActivityType(id: .wheelchairRunPace, description: "Wheelchair Run Pace")
  public static let wheelchairWalkPace = ActivityType(id: .wheelchairWalkPace, description: "Wheelchair Walk Pace")
  public static let wrestling = ActivityType(id: .wrestling, description: "Wrestling")
  public static let yoga = ActivityType(id: .yoga, description: "Yoga", isPopular: true)
  public static let socialDance = ActivityType(id: .socialDance, description: "Dance (Social)")
  public static let cardioDance = ActivityType(id: .cardioDance, description: "Dance (Cardio)", isPopular: true)
  private static let rawValueMap = [ActivityTypeId.RawValue: Int](uniqueKeysWithValues: all.enumerated().map { ($1.id.rawValue, $0) })
  private static let idMap = [ActivityTypeId: Int](uniqueKeysWithValues: all.enumerated().map { ($1.id, $0) })
}

public extension ActivityType {
  
  public static let all: [Self] = [.americanFootball, .archery, .australianFootball, .badminton, .barre, .baseball, .basketball, .bowling, .boxing, .climbing, .coreTraining, .cricket, .crossCountrySkiing, .crossTraining, .curling, .cycling, .dance, .discSports, .downhillSkiing, .elliptical, .equestrianSports, .fencing, .fishing, .fitnessGaming, .flexibility, .functionalStrengthTraining, .golf, .gymnastics, .handball, .handCycling, .highIntensityIntervalTraining, .hiking, .hockey, .hunting, .jumpRope, .kickboxing, .lacrosse, .martialArts, .mindAndBody, .mixedCardio, .paddleSports, .pilates, .play, .preparationAndRecovery, .racquetball, .rowing, .rugby, .running, .sailing, .skatingSports, .snowboarding, .snowSports, .soccer, .softball, .squash, .stairClimbing, .stairs, .stepTraining, .surfingSports, .swimming, .tableTennis, .taiChi, .tennis, .trackAndField, .traditionalStrengthTraining, .volleyball, .walking, .waterFitness, .waterPolo, .waterSports, .wheelchairRunPace, .wheelchairWalkPace, .wrestling, .yoga, .other]
}
