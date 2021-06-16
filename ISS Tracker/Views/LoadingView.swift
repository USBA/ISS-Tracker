//
//  LoadingView.swift
//  ISS Tracker
//
//  Created by Umayanga Alahakoon on 6/16/21.
//

import SwiftUI
import MapKit

struct LoadingView: View {
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(),
        span: MKCoordinateSpan(
            latitudeDelta: 100,
            longitudeDelta: 100
        )
    )
    
    var overlayText: some View {
        VStack(spacing: 15) {
            ProgressView()
            if #available(iOS 15.0, *) {
                Text("Spying")
                    .font(.title)
                    .foregroundStyle(.tertiary)
            } else {
                // Fallback on earlier versions
                Text("Spying")
                    .font(.title)
                    .foregroundColor(Color.gray.opacity(0.5))
            }
        }
    }

    var body: some View {
        if #available(iOS 15.0, *) {
            Map(coordinateRegion: $region)
                .edgesIgnoringSafeArea(.all)
                .overlay(.thinMaterial)
                .overlay(overlayText)
        } else {
            // Fallback on earlier versions
            Map(coordinateRegion: $region)
                .overlay(BlurView(effect: .systemThinMaterial))
                .edgesIgnoringSafeArea(.all)
                .overlay(overlayText)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
