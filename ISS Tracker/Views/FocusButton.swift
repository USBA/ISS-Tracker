//
//  FocusButton.swift
//  ISS Tracker
//
//  Created by Umayanga Alahakoon on 6/15/21.
//

import SwiftUI
import MapKit

struct FocusButton: View {
    @Binding var region: MKCoordinateRegion
    
    var issData: ISS

    var body: some View {
        Button {
            withAnimation {
                region.center = CLLocationCoordinate2D(
                    latitude: issData.latitude,
                    longitude: issData.longitude)
                
                if region.span.latitudeDelta < 10 {
                    region.span.latitudeDelta = 30
                }
                if region.span.longitudeDelta < 10 {
                    region.span.longitudeDelta = 30
                }
            }
        } label: {
            Image(systemName: "location.fill.viewfinder")
                .foregroundColor(.secondary)
                .padding(10)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}
