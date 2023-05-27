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
            
        case .startGeocodingRequest:
            guard let url = getWebServiceUrlString(state.searchQuery) else {
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
            
        default:
            break
        }
        return Empty().eraseToAnyPublisher()
    }
}

func getWebServiceUrlString(_ searchQuery: String) -> URL? {
    var urlString = WebConstants.geocodingUrl
    urlString += "?q=\(searchQuery)"
    urlString += "&limit=5&appid="
    urlString += WebConstants.apiKey
    guard let url = URL(string: urlString) else {
        return nil
    }
    return url
}
