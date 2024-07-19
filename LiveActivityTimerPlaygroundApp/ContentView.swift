//
//  ContentView.swift
//  LiveActivityTimerPlaygroundApp
//
//  Created by Daniel Yankiver on 7/17/24.
//

import SwiftUI

struct ContentView: View {
  // Boolean indicates wether the timer is running or not.
  @State var isTimerRunning = false
  
  @State var startTime = Date()

  // The interval difference between total and remaining duration.
  @State var interval = TimeInterval()
  // The actual total duration.
  @State var totalDuration: TimeInterval = 2 * 60
  // The remaining duration.
  @State var duration: TimeInterval = 2 * 60
  // Timer progress.
  @State var progress = 1.0
  // Timer which will publish update every one second.
  @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

  var body: some View {
    VStack {
      Spacer()

      if isTimerRunning {
        CircleTimerView(progress: $progress, duration: $duration)
      }

      Spacer()

      HStack(spacing: 24) {
        Button {
          // 1. start action
          startTime = Date()
          startTimer()
        } label: {
          Text("Start")
          Image(systemName: "stopwatch")
        }
        .timerButtonStyle(isValid: !isTimerRunning)
        .disabled(isTimerRunning)

        Button {
          // 2. stop action
          stopTimer()
        } label: {
          Text("Stop")
          Image(systemName: "stop.circle")
        }
        .timerButtonStyle(isValid: isTimerRunning)
        .disabled(!isTimerRunning)
      }
    }
    .padding()
    .onReceive(timer) { time in
      if (isTimerRunning) {
        interval = Date().timeIntervalSince(startTime)
        duration = totalDuration - interval
        progress = (duration / totalDuration)

        if duration <= 0 {
          stopTimer()
        }
      }
    }
  }

  func startTimer() {
    self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    isTimerRunning.toggle()
  }

  func stopTimer() {
    self.timer.upstream.connect().cancel()
    resetTimer()
    isTimerRunning.toggle()
  }

  // Call the following function after
  // self.timer.upstream.connect().cancel() in stopTimer() function.
  func resetTimer() {
    totalDuration = 120
    duration = 120
    progress = 1.0
  }
}

#Preview {
  ContentView()
}
