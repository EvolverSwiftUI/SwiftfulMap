//
//  LocationsViewModel.swift
//  SwiftfulMap
//
//  Created by Sivaram Yadav on 1/26/22.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
