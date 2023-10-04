//
// ActivityView.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(SwiftUI) && os(watchOS)
  import GBeatKit
  import SwiftUI

  @available(macOS 11.0, iOS 14.0, watchOS 7.0, *)
  public struct ActivityView: View {
    @EnvironmentObject var object: WatchObject

    public static let unknownTimeText = "--"

    public static let dateComponentsFormatter: DateComponentsFormatter = {
      let formatter = DateComponentsFormatter()
      formatter.allowedUnits = [.minute, .second]
      formatter.zeroFormattingBehavior = .pad
      return formatter
    }()

    static let backgroundColors = BrandingRangeCollection(colors: Color.Brand.primary, values: [
      BrandingRangeColorValues.blue,
      BrandingRangeColorValues.green,
      BrandingRangeColorValues.yellow,
      BrandingRangeColorValues.red
    ])

    var heartRateValueText: String {
      let text: String
      if let heartRate = object.data.heartRate {
        text = String(format: "%.f", heartRate)
      } else {
        text = "--"
      }
      return text
    }

    var activeEnergyBurnedText: String {
      let text: String
      if let activeEnergyBurned = object.data.activeEnergyBurned {
        text = String(format: "%.f", activeEnergyBurned)
      } else {
        text = "--"
      }
      return text
    }

    var intensityText: String {
      let text: String
      if let intensityPercentValue {
        text = String(format: "%.f", round(intensityPercentValue))
      } else {
        text = "--"
      }
      return text
    }

    var timeText: String {
      object.elapsed.flatMap(Self.dateComponentsFormatter.string(from:)) ?? Self.unknownTimeText
    }

    var intensityPercentValue: Double? {
      guard let dateOfBirth = object.dateOfBirth, let heartRate = object.data.heartRate else {
        return nil
      }

      let secondsSinceNow = -dateOfBirth.timeIntervalSinceNow
      let age = secondsSinceNow / 31_556_952.0
      let maxHeartRate = 208.0 - (0.7 * age)
      let intensityCalculated = heartRate / maxHeartRate * 100.0
      return min(intensityCalculated, 99.0)
    }

    var backgroundColor: Color {
      Self.backgroundColors.color(forValue: intensityPercentValue)
    }

    public var body: some View {
      VStack(spacing: 4.0) {
        HStack(alignment: .top) {
          Text(intensityText)
            .font(.system(size: 54, weight: .bold)).padding(.vertical, -10)
          Text("%")
            .font(.system(size: 18, weight: .bold)).layoutPriority(100)
          Spacer()

          VStack(alignment: .trailing, spacing: -4.0) {
            Text(self.heartRateValueText).font(.system(size: 20.0, weight: .bold))
            Text("BPM").font(.system(size: 12.5, weight: .medium))
          }
        }.padding(8.0).background(self.backgroundColor).cornerRadius(8.0).foregroundColor(.black)

        HStack {
          Text(self.activeEnergyBurnedText)
            .font(.system(size: 15, weight: .bold)).padding(.vertical, -10)
          Text("cals")
            .font(.system(size: 15, weight: .medium))
          Spacer()

          Text(timeText)
            .font(.system(size: 15, weight: .bold)).padding(.vertical, -10)
        }.padding(8.0).background(self.backgroundColor).cornerRadius(8.0).foregroundColor(.black)
      }
    }
  }
#endif
