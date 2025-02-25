//
//  TripTrackerApp.swift
//  TripTracker
//
//  Created by Satheesh on 25/02/25.
//

import SwiftUI
import Firebase

@main
struct TripTrackerApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
