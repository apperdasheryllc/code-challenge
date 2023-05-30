//
//  CodeChallenge01App.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import SwiftUI

let apiKey = "{api-key-goes-here}"

@main
struct CodeChallenge01App: App {
    let store = MyStore(
        initial: AppState(),
        reducer: appReducer,
        middlewares: [
            geocodingMiddleware(service: GeocodingService()),
            userLocationMiddleware(service: LocationManagerService())
        ]
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
