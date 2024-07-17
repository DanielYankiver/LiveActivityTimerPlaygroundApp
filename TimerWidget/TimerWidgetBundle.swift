//
//  TimerWidgetBundle.swift
//  TimerWidget
//
//  Created by dy8950 on 7/17/24.
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
