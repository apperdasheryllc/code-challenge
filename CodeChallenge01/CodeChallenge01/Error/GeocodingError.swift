//
//  GeocodingError.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import Foundation

enum GeocodingError: Error {
    case missingData
    case requestFailed
}

extension GeocodingError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("API Response is missing valid data.", comment: "")
        case .requestFailed:
            return NSLocalizedString("API Request failed.", comment: "")
        }
    }
}

extension GeocodingError: Identifiable {
    public var id: String? {
        errorDescription
    }
}
