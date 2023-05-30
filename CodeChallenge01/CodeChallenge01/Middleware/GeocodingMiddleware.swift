//
//  GeocodingMiddleware.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import Combine
import Foundation

func geocodingMiddleware(service: GeocodingService) -> Middleware<AppState, Action> {    
    return { state, action in
        switch action {
            
            /// Reverse geocode user's current location
        case .foundUserLocation(let location):
            let urlString = WebConstants.getReverseGeocodeUrl(
                lat: location.coordinate.latitude,
                lon: location.coordinate.longitude
            )
            guard let url = URL(string: urlString) else {
                break
            }
            return service.fetchData(url: url)
                .subscribe(on: DispatchQueue.main)
                .tryMap { value in
                    Action.didReverseGeocodeData(value)
                }
                .catch { error in
                    return Just(Action.errorOccurred(error: error))
                        .eraseToAnyPublisher()
                }
                .eraseToAnyPublisher()
            
            /// Geocode location by name
        case .startGeocodingRequest:
            let urlString = WebConstants.getGeocodeUrl(state.searchQuery)
            guard let url = URL(string: urlString) else {
                break
            }
            return service.fetchData(url: url)
                .subscribe(on: DispatchQueue.main)
                .tryMap { value in
                    Action.didFetchGeocodingData(value)
                }
                .catch { error in
                    return Just(Action.errorOccurred(error: error))
                        .eraseToAnyPublisher()
                }
                .eraseToAnyPublisher()
            
            /// Get weather data for selected location
        case .didSelect(let location):
            let urlString = WebConstants.getWeatherUrl(lat: location.lat, lon: location.lon)
            guard let url = URL(string: urlString) else {
                break
            }
            return service.fetchData(url: url)
                .subscribe(on: DispatchQueue.main)
                .tryMap { value in
                    Action.didFetchWeatherData(value)
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
