//
//  ContentView.swift
//  Shared
//
//  Created by Borja Arias Drake on 30.04.2021..
//

import SwiftUI
import ClockUI

struct AnalogClockContentView: View {
    @ObservedObject private var stopWatch: StopWatch
    
    init(stopWatch: StopWatch) {
        self.stopWatch = stopWatch
    }
    
    var body: some View {        
        
        #if os(macOS)
        let clockConfig = AnalogClockConfiguration(backgroundColor: Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 0),
                                                   tickColor: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1),
                                                   secondsPointerColor: Color(NSColor.green))
        #elseif os(iOS)
        let clockConfig = AnalogClockConfiguration(backgroundColor: Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 0),
                                                   tickColor: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1),
                                                   secondsPointerColor: Color(.sRGB, red: 255, green: 0, blue: 0, opacity: 1))
        #elseif os(watchOS)
        let clockConfig = AnalogClockConfiguration(backgroundColor: Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 1),
                                                   tickColor: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1),
                                                   secondsPointerColor: Color(.sRGB, red: 0, green: 0, blue: 255, opacity: 1))
        #else
        let clockConfig = AnalogClockConfiguration(backgroundColor: Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 1),
                                                   tickColor: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1),
                                                   secondsPointerColor: Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 1))
        #endif
        
        
        AnalogClock(seconds: stopWatch.counter, configuration: clockConfig)
            .onAppear(perform: {
                stopWatch.start()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnalogClockContentView(stopWatch: StopWatch())
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
