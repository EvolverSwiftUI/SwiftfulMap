//
//  LocationsView.swift
//  SwiftfulMap
//
//  Created by Sivaram Yadav on 1/26/22.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
//    @StateObject private var vm = LocationsViewModel()
    @EnvironmentObject private var vm: LocationsViewModel
    
    // This mapRegion will need to move ViewModel
    //@State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
    //    center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
    //    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    //)
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
