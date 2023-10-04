//
// WatchRootView.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(SwiftUI) && os(watchOS)
  import SwiftUI

  @available(OSX 11.0, iOS 14.0, watchOS 7.0, *)
  public struct WatchRootView: View {
    @State var endWorkoutAlert: Bool = false
    @EnvironmentObject var object: WatchObject
    @State private var selection = 2
    public init() {}

    @available(*, deprecated)
    public var overlayColor: Color {
      .green
    }

    public var body: some View {
      NavigationView {
        ZStack {
          if !self.object.isReachable || !self.object.isCompanionAppInstalled || self.object.activationState != .activated {
            NoPhoneConnectionView()
          } else {
            if !self.object.atFacility {
              NoFacilityView()
            } else {
              Group {
                if self.object.workout == nil, self.object.busyState == nil {
                  WatchStartWorkoutView()
                }
              }
              Group {
                if self.object.workout != nil, self.object.busyState == nil {
                  TabView(selection: self.$selection) {
                    WatchWorkoutRunningView(endWorkoutAlert: self.$endWorkoutAlert).tag(1)
                    ActivityView().tag(2)
                  }.onDisappear {
                    self.selection = 2
                  }
                }
              }
              Group {
                self.object.busyState.map {
                  Text($0.description)
                }
              }
            }
          }
        }.navigationTitle {
          Text("FOD").foregroundColor(.white)
        }
        .alert(isPresented: self.$object.displayWorkoutError, content: {
          Alert(title: Text("There was an issue creating your workout. Go to your HealthApp on your iPhone to verify permissions."), message: nil, dismissButton: nil)
        })
      }.alert(isPresented: self.$endWorkoutAlert, content: {
        Alert(title: Text("Do you want to end your workout?"), message: nil, primaryButton: .cancel(), secondaryButton: .destructive(Text("Yes"), action: self.object.endWorkout))
      }).onAppear {
        self.object.beginHealthAuthorization()
      }
    }
  }

#endif
