//
//  File.swift
//  
//
//  Created by Borja Arias Drake on 10.07.2022..
//

import Foundation
import SwiftUI

public enum Config {
    public static func `default`() -> AnalogClockConfiguration {
    #if os(macOS)
        return AnalogClockConfiguration(backgroundColor: Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 0),
                                        tickColor: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1),
                                        secondsPointerColor: Color(NSColor.red))
    #elseif os(iOS)
        return AnalogClockConfiguration(backgroundColor: Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 0),
                                        tickColor: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1),
                                        secondsPointerColor: Color(.sRGB, red: 255, green: 0, blue: 0, opacity: 1))
    #elseif os(watchOS)
        return AnalogClockConfiguration(backgroundColor: Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 1),
                                        tickColor: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1),
                                        secondsPointerColor: Color(.sRGB, red: 0, green: 0, blue: 255, opacity: 1))
    #else
        return AnalogClockConfiguration(backgroundColor: Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 1),
                                        tickColor: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 1),
                                        secondsPointerColor: Color(.sRGB, red: 255, green: 255, blue: 255, opacity: 1))
    #endif
    }
}
