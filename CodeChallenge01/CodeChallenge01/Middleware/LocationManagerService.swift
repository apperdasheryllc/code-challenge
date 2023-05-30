//
//  LocationManagerService.swift
//  CodeChallenge01
//
//  Created by Graham Diehl on 5/30/23.
//

import Combine
import CoreLocation
import Foundation

/// Relies on new CoreLocationUI LocationButton for authorization status approval

class LocationManagerService: NSObject {
    private let locationManager: CLLocationManager
    private let locationSubject = PassthroughSubject<CLLocation, Error>()
    
    var locationPublisher: AnyPublisher<CLLocation, Error> {
        locationSubject.eraseToAnyPublisher()
    }
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
    }
    
    deinit {
        locationManager.stopUpdatingLocation()
        locationSubject.send(completion: .finished)
    }
    
    func startLocationService() {
        locationManager.startUpdatingLocation()
    }
    
    func stopLocationService() {
        locationManager.stopUpdatingLocation()
    }
}

extension LocationManagerService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        locationSubject.send(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationSubject.send(completion: .failure(error))
    }
}
