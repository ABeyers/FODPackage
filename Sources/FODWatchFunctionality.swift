//
//  Initiate.swift
//  FitnessOnDemandStream
//
//  Created by Amanda Beyers on 10/3/23.
//

import SwiftUI
import GBeatKit
import GBeatUI


public class FODWatchFunctionality {
  @ObservedObject var object = WorkoutStatusObject()
    
    public func launchWatchApp(info: Dictionary<Any, Any>) -> ActivationState {
      let workoutInfo = WorkoutInfo(displayName: info["displayName"], userId: info["userId"], age: info["age"], facilityId: info["facilityId"], facilityName: info["facilityName"], activityTypeId: info["activityTypeId"], activityName: info["activityName"])
      return object.startWorkout(workoutInfo)
    }
    
    public func leaveFacility() {
      object.leaveFacility()
    }
}
