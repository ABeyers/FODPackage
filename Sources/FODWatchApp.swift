//
// FODComDemoApp.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import GBeatUI
import SwiftUI

struct FODWatchApp: App {
  
  @ApplicationDelegateAdaptor var appDelegate: AppDelegate
  
  @main
  
  var body: some Scene {
    WindowGroup {
      #if canImport(SwiftUI) && os(watchOS)
        WatchRootView().environmentObject(WatchObject(applicationDelegate: appDelegate))
      #else
//        PhoneSampleView()
      #endif
    }
  }
}
