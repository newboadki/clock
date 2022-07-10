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
    private let configuration: AnalogClockConfiguration
    
    init(stopWatch: StopWatch, configuration: AnalogClockConfiguration) {
        self.stopWatch = stopWatch
        self.configuration = configuration
    }
    
    var body: some View {        
        AnalogClock(seconds: stopWatch.counter, configuration: configuration)
            .onAppear(perform: {
                stopWatch.start()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let config = AnalogClockConfiguration(
        backgroundColor: Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 0),
        tickColor: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1),
        secondsPointerColor: Color(.sRGB, red: 255, green: 0, blue: 0, opacity: 1))
    
    static var previews: some View {
        AnalogClockContentView(stopWatch: StopWatch(), configuration: config)
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
