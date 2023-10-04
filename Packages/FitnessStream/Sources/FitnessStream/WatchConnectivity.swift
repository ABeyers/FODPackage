//
// WatchConnectivity.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

public enum WatchConnectivity: String, CaseIterable {
  case sessionless // no session applewatch.slash pink
  case unpaired // no paired watch applewatch.slash pink
  case session // app needs to be installed exclamationmark.applewatch yellow
  case inactive // `inactive` or preparing to start a session applewatch.radiowaves.left.and.right yellow
  case installed // app is installed and will start workout as soon as it's reachable applewatch green
  case reachable // workout can start right away applewatch.watchface green
}
