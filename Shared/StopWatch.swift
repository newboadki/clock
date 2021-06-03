//
//  StopWatch.swift
//  Clock (iOS)
//
//  Created by Borja Arias Drake on 01.05.2021..
//

import SwiftUI

class StopWatch: ObservableObject {
    static let now = Date()
    @Published var counter: TimeInterval = Double(TimeZone.current.secondsFromGMT(for: now)) + now.timeIntervalSince1970
    private var timer: Timer?
    init() {
    }
    
    func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1,
                                          repeats: true,
                                          block: { t in
                                                self.counter += 1
                                          })

    }
    
    func stop() {
        self.timer?.invalidate()
        self.timer = nil
    }
}
