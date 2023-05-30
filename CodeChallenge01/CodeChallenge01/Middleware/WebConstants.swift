//
//  WebConstants.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import Foundation

struct WebConstants {
    static let weatherUrl = "https://api.openweathermap.org/data/2.5/weather"
    static let geocodingUrl = "https://api.openweathermap.org/geo/1.0/direct"
    static let reverseGeocodingUrl = "https://api.openweathermap.org/geo/1.0/reverse"
    
    static let apiKey = "{api-key-goes-here}"
    
    static func getUrlString(inputString: String) -> String {
        let trimmedString = inputString.trimmingCharacters(in: .whitespacesAndNewlines)
        guard
            let escapedString = trimmedString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        else {
            return trimmedString
        }
        return escapedString
    }
    
    static func getWeatherUrl(lat: Double, lon: Double) -> String {
        var weatherUrl = WebConstants.weatherUrl
        weatherUrl += "?lat=\(lat)"
        weatherUrl += "&lon=\(lon)"
        weatherUrl += "&units=imperial"
        weatherUrl += "&appid=\(WebConstants.apiKey)"
        let urlString = getUrlString(inputString: weatherUrl)
        return urlString
    }

    
    static func getGeocodeUrl(_ searchQuery: String) -> String {
        var geocodingUrl = WebConstants.geocodingUrl
        geocodingUrl += "?q=\(searchQuery)"
        geocodingUrl += "&limit=5"
        geocodingUrl += "&appid=\(WebConstants.apiKey)"
        let urlString = WebConstants.getUrlString(inputString: geocodingUrl)
        return urlString
    }
    
    static func getReverseGeocodeUrl(lat: Double, lon: Double) -> String {
        var reverseGeocodeUrl = WebConstants.reverseGeocodingUrl
        reverseGeocodeUrl += "?lat=\(lat)"
        reverseGeocodeUrl += "&lon=\(lon)"
        reverseGeocodeUrl += "&limit=5"
        reverseGeocodeUrl += "&appid=\(WebConstants.apiKey)"
        let urlString = WebConstants.getUrlString(inputString: reverseGeocodeUrl)
        return urlString
    }
}
