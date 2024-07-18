//
//  TimerWidgetBundle.swift
//  TimerWidget
//
//  Created by Daniel Yankiver on 7/17/24.
//

import WidgetKit
import SwiftUI

@main
struct TimerWidgetBundle: WidgetBundle {
    var body: some Widget {
        TimerWidget()
        TimerWidgetLiveActivity()
    }
}
