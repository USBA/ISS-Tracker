//
//  PositionDetailsBar.swift
//  ISS Tracker
//
//  Created by Umayanga Alahakoon on 6/15/21.
//

import SwiftUI
import MapKit

struct PositionDetailsBar: View {
    @ObservedObject var issViewModel: ISSViewModel
    
    var issData: ISS

    var body: some View {
        if #available(iOS 15.0, *) {
            HStack {
                PositionDetailItem(title: "Latitude", locationDegree: issData.latitude)
                PositionDetailItem(title: "Longitude", locationDegree: issData.longitude)
                PositionDetailItem(title: "Altitude", locationDegree: issData.altitude)
            }
            .padding()
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        } else {
            // Fallback on earlier versions
            HStack {
                PositionDetailItem(title: "Latitude", locationDegree: issData.latitude)
                PositionDetailItem(title: "Longitude", locationDegree: issData.longitude)
                PositionDetailItem(title: "Altitude", locationDegree: issData.altitude)
            }
            .padding()
            .background(BlurView(effect: .systemMaterial))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct PositionDetailItem: View {
    var title: String
    var locationDegree: CLLocationDegrees

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                if #available(iOS 15.0, *) {
                    Text(locationDegree.formatted())
                        .font(.callout)
                        .lineLimit(1)
                } else {
                    // Fallback on earlier versions
                    Text("\(locationDegree)")
                        .font(.callout)
                        .lineLimit(1)
                }
            }
            Spacer()
        }
    }
}
