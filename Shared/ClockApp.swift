//
//  ClockApp.swift
//  Shared
//
//  Created by Borja Arias Drake on 30.04.2021..
//

import SwiftUI

@main
struct ClockApp: App {
    var body: some Scene {
        WindowGroup {
            AnalogClockContentView(stopWatch: StopWatch())
                .frame(width: 300, height: 300)
        }
    }
}
