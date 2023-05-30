//
//  WebConstants.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import Foundation

struct WebConstants {
    static let geocodingUrl = "https://api.openweathermap.org/geo/1.0/direct"
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
}
