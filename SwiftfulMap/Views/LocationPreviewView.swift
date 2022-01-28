//
//  LocationPreviewView.swift
//  SwiftfulMap
//
//  Created by Sivaram Yadav on 1/26/22.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }

            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white.opacity(0.9))
                .offset(y: 65)
        )
        //.clipped()
        .cornerRadius(10)
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }
        .environmentObject(LocationsViewModel())
    }
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.red.opacity(0.8))
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button(action: {
            vm.sheetLocation = location
        }, label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 125, height: 40)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(8)
        })
    }
    
    private var nextButton: some View {
        Button(action: {
            vm.nextButtonTapped()
        }, label: {
            Text("Next")
                .font(.headline)
                .fontWeight(.bold)
                .frame(width: 125, height: 35)
                .foregroundColor(.red)
                .background(Color.black.opacity(0.2))
                .cornerRadius(8)
        })
    }

}
