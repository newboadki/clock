//
//  ClockApp.swift
//  Shared
//
//  Created by Borja Arias Drake on 30.04.2021..
//

import SwiftUI
import ClockUI

@main
struct ClockApp: App {
    var body: some Scene {
        WindowGroup {
            AnalogClockContentView(stopWatch: StopWatch(),
                                   configuration: Config.default())
                .frame(width: 300, height: 300)
        }
    }
}
