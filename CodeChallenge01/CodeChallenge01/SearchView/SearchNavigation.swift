//
//  SearchNavigation.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/29/23.
//

import Foundation

struct SearchNavigation: Equatable {
    static func == (lhs: SearchNavigation, rhs: SearchNavigation) -> Bool {
        return lhs.geocodeLocation == rhs.geocodeLocation
    }
    
    var geocodeLocation: GeocodeLocationJSON?
    
    init() { }
    
    init(geocodeLocation: GeocodeLocationJSON) {
        self.geocodeLocation = geocodeLocation
    }
}
