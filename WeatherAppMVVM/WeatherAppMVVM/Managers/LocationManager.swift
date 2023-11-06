//
//  LocationManager.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 06.11.2023..
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var manager = CLLocationManager()
    
    @Published var locationCoordinates: CLLocationCoordinate2D?
    @Published var isFetchingLocation: Bool = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func fetchLocation() {
        isFetchingLocation = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationCoordinates = locations.first?.coordinate
        isFetchingLocation = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error fetching location: \(error)")
        isFetchingLocation = false
    }
    
}
