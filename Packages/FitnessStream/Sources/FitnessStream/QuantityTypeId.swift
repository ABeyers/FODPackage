//
// QuantityTypeId.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public enum QuantityTypeId: String {
  // Body Measurements
  case bodyMassIndex = "HKQuantityTypeIdentifierBodyMassIndex"
  case bodyFatPercentage = "HKQuantityTypeIdentifierBodyFatPercentage"
  case height = "HKQuantityTypeIdentifierHeight"
  case bodyMass = "HKQuantityTypeIdentifierBodyMass"
  case leanBodyMass = "HKQuantityTypeIdentifierLeanBodyMass"
  case waistCircumference = "HKQuantityTypeIdentifierWaistCircumference"
  // Fitness
  case stepCount = "HKQuantityTypeIdentifierStepCount"
  case distanceWalkingRunning = "HKQuantityTypeIdentifierDistanceWalkingRunning"
  case distanceCycling = "HKQuantityTypeIdentifierDistanceCycling"
  case distanceWheelchair = "HKQuantityTypeIdentifierDistanceWheelchair"
  case basalEnergyBurned = "HKQuantityTypeIdentifierBasalEnergyBurned"
  case activeEnergyBurned = "HKQuantityTypeIdentifierActiveEnergyBurned"
  case flightsClimbed = "HKQuantityTypeIdentifierFlightsClimbed"
  case nikeFuel = "HKQuantityTypeIdentifierNikeFuel"
  case appleExerciseTime = "HKQuantityTypeIdentifierAppleExerciseTime"
  case pushCount = "HKQuantityTypeIdentifierPushCount"
  case distanceSwimming = "HKQuantityTypeIdentifierDistanceSwimming"
  case swimmingStrokeCount = "HKQuantityTypeIdentifierSwimmingStrokeCount"
  case vO2Max = "HKQuantityTypeIdentifierVO2Max"
  case distanceDownhillSnowSports = "HKQuantityTypeIdentifierDistanceDownhillSnowSports"
  case appleStandTime = "HKQuantityTypeIdentifierAppleStandTime"

  // Vitals
  case heartRate = "HKQuantityTypeIdentifierHeartRate"
  case bodyTemperature = "HKQuantityTypeIdentifierBodyTemperature"
  case basalBodyTemperature = "HKQuantityTypeIdentifierBasalBodyTemperature"
  case bloodPressureSystolic = "HKQuantityTypeIdentifierBloodPressureSystolic"
  case bloodPressureDiastolic = "HKQuantityTypeIdentifierBloodPressureDiastolic"
  case respiratoryRate = "HKQuantityTypeIdentifierRespiratoryRate"
  // Beats per minute estimate of a user's lowest heart rate while at rest
  case restingHeartRate = "HKQuantityTypeIdentifierRestingHeartRate"
  // Average heartbeats per minute captured by an Apple Watch while a user is walking
  case walkingHeartRateAverage = "HKQuantityTypeIdentifierWalkingHeartRateAverage"
  // The standard deviation of heart beat-to-beat intevals (Standard Deviation of Normal to Normal)
  case heartRateVariabilitySDNN = "HKQuantityTypeIdentifierHeartRateVariabilitySDNN"

  // Results
  case oxygenSaturation = "HKQuantityTypeIdentifierOxygenSaturation"
  case peripheralPerfusionIndex = "HKQuantityTypeIdentifierPeripheralPerfusionIndex"
  case bloodGlucose = "HKQuantityTypeIdentifierBloodGlucose"
  case numberOfTimesFallen = "HKQuantityTypeIdentifierNumberOfTimesFallen"
  case electrodermalActivity = "HKQuantityTypeIdentifierElectrodermalActivity"
  case inhalerUsage = "HKQuantityTypeIdentifierInhalerUsage"
  case insulinDelivery = "HKQuantityTypeIdentifierInsulinDelivery"
  case bloodAlcoholContent = "HKQuantityTypeIdentifierBloodAlcoholContent"
  case forcedVitalCapacity = "HKQuantityTypeIdentifierForcedVitalCapacity"
  case forcedExpiratoryVolume1 = "HKQuantityTypeIdentifierForcedExpiratoryVolume1"
  case peakExpiratoryFlowRate = "HKQuantityTypeIdentifierPeakExpiratoryFlowRate"
  case environmentalAudioExposure = "HKQuantityTypeIdentifierEnvironmentalAudioExposure"
  case headphoneAudioExposure = "HKQuantityTypeIdentifierHeadphoneAudioExposure"

  // Nutrition
  case dietaryFatTotal = "HKQuantityTypeIdentifierDietaryFatTotal"
  case dietaryFatPolyunsaturated = "HKQuantityTypeIdentifierDietaryFatPolyunsaturated"
  case dietaryFatMonounsaturated = "HKQuantityTypeIdentifierDietaryFatMonounsaturated"
  case dietaryFatSaturated = "HKQuantityTypeIdentifierDietaryFatSaturated"
  case dietaryCholesterol = "HKQuantityTypeIdentifierDietaryCholesterol"
  case dietarySodium = "HKQuantityTypeIdentifierDietarySodium"
  case dietaryCarbohydrates = "HKQuantityTypeIdentifierDietaryCarbohydrates"
  case dietaryFiber = "HKQuantityTypeIdentifierDietaryFiber"
  case dietarySugar = "HKQuantityTypeIdentifierDietarySugar"
  case dietaryEnergyConsumed = "HKQuantityTypeIdentifierDietaryEnergyConsumed"
  case dietaryProtein = "HKQuantityTypeIdentifierDietaryProtein"

  case dietaryVitaminA = "HKQuantityTypeIdentifierDietaryVitaminA"
  case dietaryVitaminB6 = "HKQuantityTypeIdentifierDietaryVitaminB6"
  case dietaryVitaminB12 = "HKQuantityTypeIdentifierDietaryVitaminB12"
  case dietaryVitaminC = "HKQuantityTypeIdentifierDietaryVitaminC"
  case dietaryVitaminD = "HKQuantityTypeIdentifierDietaryVitaminD"
  case dietaryVitaminE = "HKQuantityTypeIdentifierDietaryVitaminE"
  case dietaryVitaminK = "HKQuantityTypeIdentifierDietaryVitaminK"
  case dietaryCalcium = "HKQuantityTypeIdentifierDietaryCalcium"
  case dietaryIron = "HKQuantityTypeIdentifierDietaryIron"
  case dietaryThiamin = "HKQuantityTypeIdentifierDietaryThiamin"
  case dietaryRiboflavin = "HKQuantityTypeIdentifierDietaryRiboflavin"
  case dietaryNiacin = "HKQuantityTypeIdentifierDietaryNiacin"
  case dietaryFolate = "HKQuantityTypeIdentifierDietaryFolate"
  case dietaryBiotin = "HKQuantityTypeIdentifierDietaryBiotin"
  case dietaryPantothenicAcid = "HKQuantityTypeIdentifierDietaryPantothenicAcid"
  case dietaryPhosphorus = "HKQuantityTypeIdentifierDietaryPhosphorus"
  case dietaryIodine = "HKQuantityTypeIdentifierDietaryIodine"
  case dietaryMagnesium = "HKQuantityTypeIdentifierDietaryMagnesium"
  case dietaryZinc = "HKQuantityTypeIdentifierDietaryZinc"
  case dietarySelenium = "HKQuantityTypeIdentifierDietarySelenium"
  case dietaryCopper = "HKQuantityTypeIdentifierDietaryCopper"
  case dietaryManganese = "HKQuantityTypeIdentifierDietaryManganese"
  case dietaryChromium = "HKQuantityTypeIdentifierDietaryChromium"
  case dietaryMolybdenum = "HKQuantityTypeIdentifierDietaryMolybdenum"
  case dietaryChloride = "HKQuantityTypeIdentifierDietaryChloride"
  case dietaryPotassium = "HKQuantityTypeIdentifierDietaryPotassium"
  case dietaryCaffeine = "HKQuantityTypeIdentifierDietaryCaffeine"
  case dietaryWater = "HKQuantityTypeIdentifierDietaryWater"

  case uVExposure = "HKQuantityTypeIdentifierUVExposure"
}
