//
//  LocationManager.swift
//  SwiftDataDemo
//
//  Created by Dumpa Deva Harsha on 25/03/26.
//

import Foundation
import CoreLocation
import SwiftUI
import Combine


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let manager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    @Published var location: CLLocation?
    @Published var locationName: String = "Fetching..."
    @Published var permissionDenied = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestPermission() {
        let status = manager.authorizationStatus
        
        switch status {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
            
        case .denied, .restricted:
            permissionDenied = true
            
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc = locations.last else { return }
        location = loc
        
        // 🔥 Reverse Geocoding
        geocoder.reverseGeocodeLocation(loc) { [weak self] placemarks, error in
            guard let place = placemarks?.first else { return }
            
            let city = place.locality ?? ""
            let country = place.country ?? ""
            
            DispatchQueue.main.async {
                self?.locationName = "\(city), \(country)"
            }
        }
        
        manager.stopUpdatingLocation() // stop for efficiency
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            manager.startUpdatingLocation()
        } else if status == .denied {
            permissionDenied = true
        }
    }
}
