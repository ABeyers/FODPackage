//
// WatchWorkoutRunningView.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(SwiftUI) && os(watchOS)

  import SwiftUI

  @available(OSX 11.0, iOS 14.0, watchOS 7.0, *)
  struct WatchWorkoutRunningView: View {
    @Binding var endWorkoutAlert: Bool
    @EnvironmentObject var object: WatchObject
    @State private var leaderboard = true
    @Environment(\.defaultMinListRowHeight) var minRowHeight

    let workoutDateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      let dateFormat = DateFormatter.dateFormat(fromTemplate: "MMMd", options: 0, locale: Locale.current)
      formatter.dateFormat = dateFormat
      return formatter
    }()

    public var workoutInfo: some View {
      Group {
        if let workoutData = object.activationData {
          VStack {
            Text(workoutData.workoutInfo.facilityName).fontWeight(.semibold)
            var timeText: String {
              object.elapsed.flatMap(ActivityView.dateComponentsFormatter.string(from:)) ?? ActivityView.unknownTimeText
            }
            Text(timeText)
          }
        }
      }
    }

    public var endWorkout: some View {
      Button(action: {
        self.endWorkoutAlert = true
      }) {
        Text("End Workout")
      }
      .disabled(self.object.busyState != nil)
      .buttonStyle(BorderedButtonStyle(tint: .red))
      .cornerRadius(25)
    }

    public var leaderboardToggle: some View {
      List {
        Toggle("Show On Screen", isOn: $leaderboard)
      }.frame(height: minRowHeight)
    }

    public var leaderboardInfo: some View {
      Text("Shows your heart rate tile on the display in the gym.")
        .font(.system(size: 14))
        .foregroundColor(.gray)
    }

    public var body: some View {
      ScrollView {
        VStack {
          workoutInfo
          Spacer(minLength: 10)
          endWorkout
          Spacer(minLength: 20)
          leaderboardToggle
          leaderboardInfo
        }.padding([.top], 10)
          .onAppear {
            self.object.beginHealthAuthorization()
          }
      }
    }
  }
#endif
