//
//  CurrentWeatherJSON.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/29/23.
//

import Foundation

struct CurrentWeatherJSON: Codable {
    let coord: CurrentWeatherCoord
    let weather: [CurrentWeatherDict]
    let main: CurrentWeatherMain
}

struct CurrentWeatherDict: Codable {
    let main: String
    let description: String
    let icon: String
}

struct CurrentWeatherCoord: Codable {
    let lat: Double
    let lon: Double
}

struct CurrentWeatherMain: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
}

extension CurrentWeatherJSON: Identifiable {
    var id: UUID {
        return UUID()
    }
}
