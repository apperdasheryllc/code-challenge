//
//  AppState.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import Foundation

protocol MyState {}

struct AppState: MyState {
    var counter: Int = 0
    var searchQuery: String = ""
    var alertInfo: AlertInfo?
    var geocodeLocations: [GeocodeLocationJSON] = []
    var selectedLocation: GeocodeLocationJSON?
    var currentWeather: CurrentWeatherJSON?
    
    var currentTempString: String {
        guard let currentWeather = currentWeather else {
            return ""
        }
        let temp = currentWeather.main.temp
        return String(temp)
    }
    
    var currentWeatherMain: String {
        guard
            let currentWeather = currentWeather,
            let currentWeatherInfo = currentWeather.weather.first
        else {
            return ""
        }
        return currentWeatherInfo.main
    }
    
    var currentWeatherDescription: String {
        guard
            let currentWeather = currentWeather,
            let currentWeatherInfo = currentWeather.weather.first
        else {
            return ""
        }
        return currentWeatherInfo.description
    }
}
