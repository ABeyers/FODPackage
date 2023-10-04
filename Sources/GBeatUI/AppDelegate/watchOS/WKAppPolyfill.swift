//
// WKAppPolyfill.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if os(watchOS) && canImport(SwiftUI)
  import SwiftUI
  import WatchKit

  public typealias WKAppPolyfill = WKExtension
  public typealias WKDelegateAdaptor = WKExtensionDelegateAdaptor
  public typealias WKDelegate = WKExtensionDelegate

  extension WKInterfaceDevice: Device {}
  extension WKAppPolyfill: AppInterface {
    public static var currentDevice: Device {
      WKInterfaceDevice.current()
    }

    @MainActor
    public static var sharedInterface: AppInterface {
      WKAppPolyfill.shared()
    }

    public static var notificationTopic: String? {
      "com.bpmsync.GBeat.watchkitapp"
    }
  }

  public typealias ApplicationDelegateAdaptor = WKDelegateAdaptor
  public typealias AppInterfaceObject = WKAppPolyfill
#endif
