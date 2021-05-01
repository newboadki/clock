//
//  File.swift
//  
//
//  Created by Borja Arias Drake on 01.05.2021..
//

import SwiftUI

/// This class is Multiplatform
public struct AnalogClockConfiguration {
        
    public let backgroundColor: Color
    public let tickColor: Color
    public let secondsPointerColor: Color
    
    public init(backgroundColor: Color, tickColor: Color, secondsPointerColor: Color) {
        self.backgroundColor = backgroundColor
        self.tickColor = tickColor
        self.secondsPointerColor = secondsPointerColor
    }
}
