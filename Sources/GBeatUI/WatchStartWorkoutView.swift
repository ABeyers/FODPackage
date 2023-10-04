//
// WatchStartWorkoutView.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(SwiftUI) && os(watchOS)

  import SwiftUI

  @available(OSX 11.0, iOS 14.0, watchOS 7.0, *)
  struct WatchStartWorkoutView: View {
    @EnvironmentObject var object: WatchObject
    @State private var leaderboard = true
    @Environment(\.defaultMinListRowHeight) var minRowHeight

    public var start: some View {
      Button(action: {
        self.object.startWorkout()
      }) {
        Text("Start")
          .font(.system(size: 26, weight: .semibold))
      }
      .frame(width: 108, height: 108)
      .buttonStyle(BorderedButtonStyle(tint: .black))
      .foregroundColor(Color.white)
      .overlay(Circle()
        .stroke(Color.white, lineWidth: 4))
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
      ScrollView(.vertical) {
        VStack {
          start
          Spacer(minLength: 25)
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
