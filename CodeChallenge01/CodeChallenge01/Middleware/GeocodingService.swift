//
//  GeocodingService.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import Combine
import Foundation

class GeocodingService {
    func fetchData(url: URL) -> AnyPublisher<Data, Error> {
        let urlSession = URLSession.shared
        let urlRequest = URLRequest(url: url)
        return URLSession.DataTaskPublisher(request: urlRequest, session: urlSession)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw GeocodingError.requestFailed
                }
                guard !data.isEmpty else {
                    throw GeocodingError.missingData
                }
                return data
            }
            .mapError { error in
                if let error = error as? GeocodingError {
                    return error
                }
                else {
                    return GeocodingError.missingData
                }
            }
            .eraseToAnyPublisher()
    }
}
