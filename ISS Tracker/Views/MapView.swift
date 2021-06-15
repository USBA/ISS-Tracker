//
//  MapView.swift
//  ISS Tracker
//
//  Created by Umayanga Alahakoon on 6/15/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Binding var region: MKCoordinateRegion
    
    @Binding var issMark: [ISS]

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: issMark) { mark in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: mark.latitude, longitude: mark.longitude)) {
                Text("🛰")
                    .font(.largeTitle)
                    .padding()
                    .background(.thickMaterial)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
