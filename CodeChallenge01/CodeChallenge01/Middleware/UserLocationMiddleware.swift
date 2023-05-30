//
//  UserLocationMiddleware.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/30/23.
//

import Combine
import Foundation

func userLocationMiddleware(service: LocationManagerService) -> Middleware<AppState, Action> {
    return { state, action in
        switch action {
        case .foundUserLocation:
            service.stopLocationService()
            
        case .requestedLocation:
            service.startLocationService()
            return service.locationPublisher
                .debounce(for: 1.0, scheduler: DispatchQueue.main)
                .map {
                    Action.foundUserLocation(location: $0)
                }
                .catch { error in
                    return Just(Action.errorOccurred(error: error))
                        .eraseToAnyPublisher()
                }
                .eraseToAnyPublisher()
            
        default:
            break
        }
        return Empty().eraseToAnyPublisher()
    }
}
