//
//  StopWatch.swift
//  Clock (iOS)
//
//  Created by Borja Arias Drake on 01.05.2021..
//

import SwiftUI

class StopWatch: ObservableObject {
    @Published var counter: TimeInterval = 0
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
