//
//  Reducer.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import Foundation


typealias Reducer<MyState, Action> = (MyState, Action) -> MyState

let appReducer: Reducer<AppState, Action> = { state, action in
    var mutatingState = state
    
    switch action {
    case .didTap:
        mutatingState.counter += 1
        
    case .search(let text):
        mutatingState.searchQuery = text
        
    case .startGeocodingRequest:
        break
        
    case .didFetchGeocodingData(let data):
        print("decode data")
        
    case .errorOccurred(let error):
        mutatingState.alertInfo = AlertInfo(
            title: "Geocoding Error",
            description: error.localizedDescription
        )
        
    case .dismissAlert:
        mutatingState.alertInfo = nil
    }
    
    return mutatingState
}
