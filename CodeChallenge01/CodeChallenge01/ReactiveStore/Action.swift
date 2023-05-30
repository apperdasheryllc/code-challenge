//
//  Action.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import CoreLocation
import Foundation

enum Action {
    case didTap
    case search(text: String)
    case startGeocodingRequest
    case didFetchGeocodingData(_ data: Data)
    case errorOccurred(error: Error)
    case dismissAlert
    case requestedLocation
    case didSelect(_ location: GeocodeLocationJSON)
    case didFetchWeatherData(_ data: Data)
    case foundUserLocation(location: CLLocation)
    case didReverseGeocodeData(_ data: Data)
}
