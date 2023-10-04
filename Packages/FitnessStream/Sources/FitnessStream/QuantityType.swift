//
// QuantityType.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public struct QuantityType: SampleType, Hashable {
  public static let sampleMetaType: SampleMetaType = QuantityMetaType()

  public var sampleRawValue: String? {
    id.rawValue
  }

  public let id: QuantityTypeId

  public init(id: QuantityTypeId) {
    self.id = id
  }

  public init(rawValue: QuantityTypeId.RawValue) {
    guard let id = QuantityTypeId(rawValue: rawValue) else {
      preconditionFailure()
    }

    self.id = id
  }

  // Measurements
  public static let bodyMassIndex = QuantityType(id: .bodyMassIndex)
  public static let bodyFatPercentage = QuantityType(id: .bodyFatPercentage)
  public static let height = QuantityType(id: .height)
  public static let bodyMass = QuantityType(id: .bodyMass)
  public static let leanBodyMass = QuantityType(id: .leanBodyMass)
  public static let waistCircumference = QuantityType(id: .waistCircumference)
  public static let stepCount = QuantityType(id: .stepCount)
  public static let distanceWalkingRunning = QuantityType(id: .distanceWalkingRunning)
  public static let distanceCycling = QuantityType(id: .distanceCycling)
  public static let distanceWheelchair = QuantityType(id: .distanceWheelchair)
  public static let basalEnergyBurned = QuantityType(id: .basalEnergyBurned)
  public static let activeEnergyBurned = QuantityType(id: .activeEnergyBurned)
  public static let flightsClimbed = QuantityType(id: .flightsClimbed)
  public static let nikeFuel = QuantityType(id: .nikeFuel)
  public static let appleExerciseTime = QuantityType(id: .appleExerciseTime)
  public static let pushCount = QuantityType(id: .pushCount)
  public static let distanceSwimming = QuantityType(id: .distanceSwimming)
  public static let swimmingStrokeCount = QuantityType(id: .swimmingStrokeCount)
  public static let vO2Max = QuantityType(id: .vO2Max)
  public static let distanceDownhillSnowSports = QuantityType(id: .distanceDownhillSnowSports)
  public static let appleStandTime = QuantityType(id: .appleStandTime)
  public static let heartRate = QuantityType(id: .heartRate)
  public static let bodyTemperature = QuantityType(id: .bodyTemperature)
  public static let basalBodyTemperature = QuantityType(id: .basalBodyTemperature)
  public static let bloodPressureSystolic = QuantityType(id: .bloodPressureSystolic)
  public static let bloodPressureDiastolic = QuantityType(id: .bloodPressureDiastolic)
  public static let respiratoryRate = QuantityType(id: .respiratoryRate)
  public static let restingHeartRate = QuantityType(id: .restingHeartRate)
  public static let walkingHeartRateAverage = QuantityType(id: .walkingHeartRateAverage)
  public static let heartRateVariabilitySDNN = QuantityType(id: .heartRateVariabilitySDNN)
  public static let oxygenSaturation = QuantityType(id: .oxygenSaturation)
  public static let peripheralPerfusionIndex = QuantityType(id: .peripheralPerfusionIndex)
  public static let bloodGlucose = QuantityType(id: .bloodGlucose)
  public static let numberOfTimesFallen = QuantityType(id: .numberOfTimesFallen)
  public static let electrodermalActivity = QuantityType(id: .electrodermalActivity)
  public static let inhalerUsage = QuantityType(id: .inhalerUsage)
  public static let insulinDelivery = QuantityType(id: .insulinDelivery)
  public static let bloodAlcoholContent = QuantityType(id: .bloodAlcoholContent)
  public static let forcedVitalCapacity = QuantityType(id: .forcedVitalCapacity)
  public static let forcedExpiratoryVolume1 = QuantityType(id: .forcedExpiratoryVolume1)
  public static let peakExpiratoryFlowRate = QuantityType(id: .peakExpiratoryFlowRate)
  public static let environmentalAudioExposure = QuantityType(id: .environmentalAudioExposure)
  public static let headphoneAudioExposure = QuantityType(id: .headphoneAudioExposure)
  public static let dietaryFatTotal = QuantityType(id: .dietaryFatTotal)
  public static let dietaryFatPolyunsaturated = QuantityType(id: .dietaryFatPolyunsaturated)
  public static let dietaryFatMonounsaturated = QuantityType(id: .dietaryFatMonounsaturated)
  public static let dietaryFatSaturated = QuantityType(id: .dietaryFatSaturated)
  public static let dietaryCholesterol = QuantityType(id: .dietaryCholesterol)
  public static let dietarySodium = QuantityType(id: .dietarySodium)
  public static let dietaryCarbohydrates = QuantityType(id: .dietaryCarbohydrates)
  public static let dietaryFiber = QuantityType(id: .dietaryFiber)
  public static let dietarySugar = QuantityType(id: .dietarySugar)
  public static let dietaryEnergyConsumed = QuantityType(id: .dietaryEnergyConsumed)
  public static let dietaryProtein = QuantityType(id: .dietaryProtein)
  public static let dietaryVitaminA = QuantityType(id: .dietaryVitaminA)
  public static let dietaryVitaminB6 = QuantityType(id: .dietaryVitaminB6)
  public static let dietaryVitaminB12 = QuantityType(id: .dietaryVitaminB12)
  public static let dietaryVitaminC = QuantityType(id: .dietaryVitaminC)
  public static let dietaryVitaminD = QuantityType(id: .dietaryVitaminD)
  public static let dietaryVitaminE = QuantityType(id: .dietaryVitaminE)
  public static let dietaryVitaminK = QuantityType(id: .dietaryVitaminK)
  public static let dietaryCalcium = QuantityType(id: .dietaryCalcium)
  public static let dietaryIron = QuantityType(id: .dietaryIron)
  public static let dietaryThiamin = QuantityType(id: .dietaryThiamin)
  public static let dietaryRiboflavin = QuantityType(id: .dietaryRiboflavin)
  public static let dietaryNiacin = QuantityType(id: .dietaryNiacin)
  public static let dietaryFolate = QuantityType(id: .dietaryFolate)
  public static let dietaryBiotin = QuantityType(id: .dietaryBiotin)
  public static let dietaryPantothenicAcid = QuantityType(id: .dietaryPantothenicAcid)
  public static let dietaryPhosphorus = QuantityType(id: .dietaryPhosphorus)
  public static let dietaryIodine = QuantityType(id: .dietaryIodine)
  public static let dietaryMagnesium = QuantityType(id: .dietaryMagnesium)
  public static let dietaryZinc = QuantityType(id: .dietaryZinc)
  public static let dietarySelenium = QuantityType(id: .dietarySelenium)
  public static let dietaryCopper = QuantityType(id: .dietaryCopper)
  public static let dietaryManganese = QuantityType(id: .dietaryManganese)
  public static let dietaryChromium = QuantityType(id: .dietaryChromium)
  public static let dietaryMolybdenum = QuantityType(id: .dietaryMolybdenum)
  public static let dietaryChloride = QuantityType(id: .dietaryChloride)
  public static let dietaryPotassium = QuantityType(id: .dietaryPotassium)
  public static let dietaryCaffeine = QuantityType(id: .dietaryCaffeine)
  public static let dietaryWater = QuantityType(id: .dietaryWater)
  public static let uVExposure = QuantityType(id: .uVExposure)
}
