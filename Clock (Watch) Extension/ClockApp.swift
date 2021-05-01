//
//  ClockApp.swift
//  Clock (Watch) Extension
//
//  Created by Borja Arias Drake on 30.04.2021..
//

import SwiftUI

@main
struct ClockWatchApp: App {
    var body: some Scene {
        WindowGroup {
            AnalogClockContentView(stopWatch: StopWatch())
                .frame(width: 150, height: 150)
        }
    }
}
