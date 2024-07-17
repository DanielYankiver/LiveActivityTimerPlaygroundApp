//
//  TimerAttributes.swift
//  LiveActivityTimerPlaygroundApp
//
//  Created by Daniel Yankiver on 7/17/24.
//

import ActivityKit

struct TimerAttributes: ActivityAttributes {

  public typealias TimeTrackingStatus = ContentState

  public struct ContentState: Codable, Hashable {
    var duration: String
    var progress: Double
  }

  var name: String
}
