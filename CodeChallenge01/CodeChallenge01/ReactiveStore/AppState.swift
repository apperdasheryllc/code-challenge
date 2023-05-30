//
//  AppState.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import CoreLocation
import Foundation

protocol MyState {}

struct AppState: MyState {
    var counter: Int = 0
    var searchQuery: String = ""
    var alertInfo: AlertInfo?
    var geocodeLocations: [GeocodeLocationJSON] = []
    var selectedLocation: GeocodeLocationJSON?
    var currentWeather: CurrentWeatherJSON?
    var userLocation: CLLocation?
    
    var currentTempString: String {
        guard let currentWeather = currentWeather else {
            return ""
        }
        let temp = currentWeather.main.temp
        var tempString = String(temp)
        tempString += "°"
        return tempString
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
    
    var currentWeatherIconName: String {
        guard
            let currentWeather = currentWeather,
            let currentWeatherInfo = currentWeather.weather.first
        else {
            return ""
        }
        return currentWeatherInfo.icon
    }
    
    var currentWeatherIconUrl: String {
        guard !currentWeatherIconName.isEmpty else {
            return ""
        }
        let urlString = "https://openweathermap.org/img/wn/\(currentWeatherIconName)@2x.png"
        return urlString
    }
}
