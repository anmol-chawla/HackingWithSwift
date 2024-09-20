//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Anmol Chawla on 20/09/24.
//

import CoreLocation
import Foundation
import MapKit


extension ContentView {
    
    @Observable
    class ViewModel {
        private(set) var locations: [Location]
        var selectedLocation: Location?
        
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }

        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation  = Location(
                id: UUID(),
                name: "New Location",
                description: "",
                latitude: point.latitude,
                longitude: point.longitude
            )
            locations.append(newLocation)
            save()
        }
        
        func updateLocation(location: Location) {
            guard let selectedLocation else { return }
            
            if let index = locations.firstIndex(of: selectedLocation) {
                locations[index] = location
                save()
            }
        }
    }
    
}
