//
//  AppStore.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import Combine
import Foundation

typealias MyStore = AppStore<AppState, Action>

typealias Middleware<AppState, Action> = (
    AppState,
    Action
) -> AnyPublisher<Action, Never>?

class AppStore<State, Action>: ObservableObject {
    @Published private(set) var state: AppState
    private let reducer: Reducer<AppState, Action>
    let middlewares: [Middleware<AppState, Action>]
    private var middlewareCancellables: Set<AnyCancellable> = []
    
    private let queue = DispatchQueue(
        label: "net.apperdashery.reactive.store",
        qos: .userInitiated
    )
    
    init(
        initial: AppState,
        reducer: @escaping Reducer<AppState, Action>,
        middlewares: [Middleware<AppState, Action>]
    ) {
        self.state = initial
        self.reducer = reducer
        self.middlewares = middlewares
    }
    
    func dispatch(_ action: Action) {
        queue.sync {
            self.dispatch(self.state, action)
        }
    }
    
    private func dispatch(_ currentState: AppState, _ action: Action) {
        let newState = reducer(currentState, action)
        state = newState
        
        for mw in middlewares {
            guard let middleware = mw(state, action) else {
                break
            }
            middleware
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: dispatch)
                .store(in: &middlewareCancellables)
        }
    }
}
