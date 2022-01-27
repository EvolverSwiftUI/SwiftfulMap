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
            //Map(coordinateRegion: $vm.mapRegion)
            mapLayer
                .ignoresSafeArea()

            VStack {
                header
                    .padding()
                Spacer()
                locationPreviewStack
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList, label: {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none)
                    .overlay(
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                        ,
                        alignment: .leading
                    )
            })
            
            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        Map(
            coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
                //MapMarker(coordinate: location.coordinates, tint: .blue)
                MapAnnotation(coordinate: location.coordinates) {
                    //Text("HELLO")
                    LocationsMapAnnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture() {
                            vm.showNextLocation(location: location)
                        }
                }
            })
    }
    
    private var locationPreviewStack: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading))
                        )
                }
            }
        }

    }
}
