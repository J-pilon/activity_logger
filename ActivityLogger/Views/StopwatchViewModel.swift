//
//  StopwatchViewModel.swift
//  ActivityLogger
//
//  Created by Josiah Pilon on 2024-02-09.
//

import Foundation
class StopwatchViewModel: ObservableObject {
    @Published var timeElapsed: String = "00:00.00"
    @Published var isRunning: Bool = false

    private var timer: Timer?
    private var startTime: Date?
    private var elapsedTime: TimeInterval = 0

    public func start() {
        startTime = Date()
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
            guard let strongSelf = self, let startTime = strongSelf.startTime else { return }
            let currentTime = Date()
            let timeDifference = currentTime.timeIntervalSince(startTime) + strongSelf.elapsedTime
            strongSelf.updateTimeElapsed(timeDifference)
        }
    }

    func pause() {
        elapsedTime += Date().timeIntervalSince(startTime ?? Date())
        isRunning = false
        timer?.invalidate()
    }

    func reset() {
        elapsedTime = 0
        isRunning = false
        timeElapsed = "00:00.00"
        timer?.invalidate()
    }

    private func updateTimeElapsed(_ time: TimeInterval) {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        let fraction = Int(time * 100) % 100
        timeElapsed = String(format: "%02i:%02i.%02i", minutes, seconds, fraction)
    }
}
