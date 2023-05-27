//
//  CodeChallenge01App.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import SwiftUI

@main
struct CodeChallenge01App: App {
    let store = MyStore(initial: AppState(), reducer: appReducer)
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
