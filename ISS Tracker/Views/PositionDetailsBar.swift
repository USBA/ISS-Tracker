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
        HStack {
            PositionDetailItem(title: "Latitude", locationDegree: issData.latitude)
            PositionDetailItem(title: "Longitude", locationDegree: issData.longitude)
            PositionDetailItem(title: "Altitude", locationDegree: issData.altitude)
        }
        .padding()
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
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
                Text(locationDegree.formatted())
                    .font(.callout)
                    .lineLimit(1)
            }
            Spacer()
        }
    }
}
