//
//  GeocodeResponseJSON.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/27/23.
//

import Foundation

struct GeocodeLocationJSON: Codable {
    let name: String
    let lat: Double
    let lon: Double
    let country: String
    var state: String?
}

extension GeocodeLocationJSON: Identifiable {
    var id: UUID {
        return UUID()
    }
}
