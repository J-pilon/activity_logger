//
//  ActivityLoggerApp.swift
//  ActivityLogger
//
//  Created by Josiah Pilon on 2023-10-20.
//

import SwiftUI
import SwiftData

@main
struct ActivityLoggerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Activity.self])
    }
}
