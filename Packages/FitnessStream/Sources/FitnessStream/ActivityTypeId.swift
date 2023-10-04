//
// ActivityTypeId.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import Foundation

@available(watchOS 7.0, iOS 14.0, *)
public enum ActivityTypeId: Int, CaseIterable, Codable {
  case americanFootball = 1

  case archery = 2

  case australianFootball = 3

  case badminton = 4

  case baseball = 5

  case basketball = 6

  case bowling = 7

  case boxing = 8 // See also HKWorkoutActivityTypeKickboxing.

  case climbing = 9

  case cricket = 10

  case crossTraining = 11

  case curling = 12

  case cycling = 13

  case dance = 14

  case elliptical = 16

  case equestrianSports = 17 // Polo, Horse Racing, Horse Riding, etc.

  case fencing = 18

  case fishing = 19

  case functionalStrengthTraining = 20 // Primarily free weights and/or body weight and/or accessories

  case golf = 21

  case gymnastics = 22

  case handball = 23

  case hiking = 24

  case hockey = 25 // Ice Hockey, Field Hockey, etc.

  case hunting = 26

  case lacrosse = 27

  case martialArts = 28

  case mindAndBody = 29 // Qigong, meditation, etc.

  case paddleSports = 31 // Canoeing, Kayaking, Outrigger, Stand Up Paddle Board, etc.

  case play = 32 // Dodge Ball, Hopscotch, Tetherball, Jungle Gym, etc.

  case preparationAndRecovery = 33 // Foam rolling, stretching, etc.

  case racquetball = 34

  case rowing = 35

  case rugby = 36

  case running = 37

  case sailing = 38

  case skatingSports = 39 // Ice Skating, Speed Skating, Inline Skating, Skateboarding, etc.

  case snowSports = 40
  case soccer = 41

  case softball = 42

  case squash = 43

  case stairClimbing = 44

  case surfingSports = 45 // Traditional Surfing, Kite Surfing, Wind Surfing, etc.

  case swimming = 46

  case tableTennis = 47

  case tennis = 48

  case trackAndField = 49 // Shot Put, Javelin, Pole Vaulting, etc.

  case traditionalStrengthTraining = 50 // Primarily machines and/or free weights

  case volleyball = 51

  case walking = 52

  case waterFitness = 53

  case waterPolo = 54

  case waterSports = 55 // Water Skiing, Wake Boarding, etc.

  case wrestling = 56

  case yoga = 57
  case barre = 58 // HKWorkoutActivityTypeDanceInspiredTraining

  case coreTraining = 59

  case crossCountrySkiing = 60

  case downhillSkiing = 61

  case flexibility = 62

  case highIntensityIntervalTraining = 63

  case jumpRope = 64

  case kickboxing = 65

  case pilates = 66 // HKWorkoutActivityTypeDanceInspiredTraining

  case snowboarding = 67

  case stairs = 68

  case stepTraining = 69

  case wheelchairWalkPace = 70

  case wheelchairRunPace = 71

  case taiChi = 72

  case mixedCardio = 73 // HKWorkoutActivityTypeMixedMetabolicCardioTraining

  case handCycling = 74

  case discSports = 75

  case fitnessGaming = 76

  case socialDance = 78

  case cardioDance = 77

  case other = 3000
}
