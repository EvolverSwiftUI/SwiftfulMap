//
//  LocationsMapAnnotationView.swift
//  SwiftfulMap
//
//  Created by Sivaram Yadav on 1/28/22.
//

import SwiftUI

struct LocationsMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map")
                .resizable()
                .scaledToFit()
                .font(.headline)
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(12)
                .background(accentColor)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(accentColor)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -8)
                .padding(.bottom, 40)
        }
    }
}

struct LocationsMapAnnotationsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            LocationsMapAnnotationView()
        }
    }
}
