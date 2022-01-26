//
//  Location.swift
//  SwiftfulMap
//
//  Created by Sivaram Yadav on 1/26/22.
//

import Foundation
import MapKit

struct Location: Identifiable {

    let name        : String
    let cityName    : String
    let coordinates : CLLocationCoordinate2D
    let description : String
    let imageNames  : [String]
    let link        : String
    
    var id: String {
        name + cityName
    }
}
