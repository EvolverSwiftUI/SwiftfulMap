//
//  LocationsListView.swift
//  SwiftfulMap
//
//  Created by Sivaram Yadav on 1/26/22.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button(action: {
                    vm.showNextLocation(location: location)
                }, label: {
                    locationsListRow(location: location)
                })
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }
}


extension LocationsListView {
    
    private func locationsListRow(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text(location.name)
                        .font(.headline)
                    Text(location.cityName)
                        .font(.subheadline)
               }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
