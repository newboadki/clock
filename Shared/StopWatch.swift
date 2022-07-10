//
//  StopWatch.swift
//  Clock (iOS)
//
//  Created by Borja Arias Drake on 01.05.2021..
//

import SwiftUI

final class StopWatch: ObservableObject {
    
    // MARK: - Internal properties
    
    static let now = Date()
    
    @Published
    var counter: TimeInterval = Double(TimeZone.current.secondsFromGMT(for: now)) + now.timeIntervalSince1970
    
    // MARK: - Private properties
    
    private var timer: Timer?
    
    // MARK: - Initializers
    
    init() {}
    
    // MARK: - API
    
    func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1,
                                          repeats: true,
                                          block: { _ in
                                                self.counter += 1
                                          })
    }
    
    func stop() {
        self.timer?.invalidate()
        self.timer = nil
    }
}
