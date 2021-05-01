//
//  CGRect+Center.swift
//  
//
//  Created by Borja Arias Drake on 01.05.2021..
//

import CoreGraphics

public extension CGRect {
    
    var center: CGPoint {
        CGPoint(x: midX, y: midY)
    }
    
    init(center: CGPoint, radius: CGFloat) {
        let diameter = radius * 2
        self = CGRect(x: center.x - radius,
                      y: center.y - radius,
                      width: diameter,
                      height: diameter)
    }
}
