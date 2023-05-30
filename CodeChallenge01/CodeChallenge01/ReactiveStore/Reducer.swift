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
        do {
            let jsonDecoder = JSONDecoder()
            let geocodeJSON = try jsonDecoder.decode([GeocodeLocationJSON].self, from: data)
            mutatingState.geocodeLocations = geocodeJSON
        } catch {
            mutatingState.alertInfo = AlertInfo(
                title: "Decoding Error",
                description: error.localizedDescription
            )
        }
        
    case .errorOccurred(let error):
        mutatingState.alertInfo = AlertInfo(
            title: "Geocoding Error",
            description: error.localizedDescription
        )
        
    case .dismissAlert:
        mutatingState.alertInfo = nil
        
    case .requestedLocation:
        print("get user location")
        
    case .didSelect(let location):
        mutatingState.selectedLocation = location
        
    case .didFetchWeatherData(let data):
        do {
            let jsonDecoder = JSONDecoder()
            let currentWeatherJSON = try jsonDecoder.decode(CurrentWeatherJSON.self, from: data)
            mutatingState.currentWeather = currentWeatherJSON
        } catch {
            mutatingState.alertInfo = AlertInfo(
                title: "Decoding Error",
                description: error.localizedDescription
            )
        }
    }
    
    return mutatingState
}
