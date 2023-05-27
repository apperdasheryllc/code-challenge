//
//  AppStore.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import Foundation

typealias MyStore = AppStore<AppState, Action>

class AppStore<State, Action>: ObservableObject {
    @Published private(set) var state: AppState
    private let reducer: Reducer<AppState, Action>
    
    private let queue = DispatchQueue(
        label: "net.apperdashery.reactive.store",
        qos: .userInitiated
    )
    
    init(
        initial: AppState,
        reducer: @escaping Reducer<AppState, Action>
    ) {
        self.state = initial
        self.reducer = reducer
    }
    
    func dispatch(_ action: Action) {
        queue.sync {
            self.dispatch(self.state, action)
        }
    }
    
    private func dispatch(_ currentState: AppState, _ action: Action) {
        let newState = reducer(currentState, action)
        state = newState
    }
}
