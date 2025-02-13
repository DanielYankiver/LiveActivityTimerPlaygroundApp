//
//  CircleTimerView.swift
//  LiveActivityTimerPlaygroundApp
//
//  Created by Daniel Yankiver on 7/17/24.
//

import SwiftUI

struct CircleTimerView: View {
  @Binding var progress: Double
  @Binding var duration: TimeInterval

  var body: some View {
    ZStack {
      Circle()
        .stroke(lineWidth: 20)
        .opacity(0.08)
        .foregroundColor(.gray)
        .frame(width: 200, height: 200)
      Circle()
        .trim(from: 0.0, to: progress)
        .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
        .rotationEffect(.degrees(270.0))
        .foregroundColor(Color.mint)
        .frame(width: 200, height: 200)
      Text(duration.format(using: [.minute, .second]))
        .font(.title2.bold())
        .foregroundColor(Color.mint)
        .contentTransition(.numericText())
    }
  }
}

extension TimeInterval {
  func format(using units: NSCalendar.Unit) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = units
    formatter.unitsStyle = .positional
    formatter.zeroFormattingBehavior = .pad
    return formatter.string(from: self) ?? ""
  }
}

extension View {
  func timerButtonStyle(isValid: Bool = true) -> some View {
    self
      .font(.title2)
      .padding()
      .background(Color.mint.opacity(isValid ? 1.0 : 0.2))
      .foregroundColor(Color.black)
      .cornerRadius(10)
      .shadow(radius: 5)
  }
}

#Preview {
  // progress is Double value between 0.0 and 1.0
  // duration is TimeInterval value representing seconds
  CircleTimerView(progress: .constant(0.4), duration: .constant(100))
}
