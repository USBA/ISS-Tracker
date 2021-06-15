//
//  ContentView.swift
//  ISS Tracker
//
//  Created by Umayanga Alahakoon on 6/15/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject var issViewModel = ISSViewModel()
    @ObservedObject var aboardDataViewModel = AboardDataViewModel()
    
    @State var region = MKCoordinateRegion()
    
    var body: some View {
        VStack {
            if let issData = issViewModel.currentData.first {
                
                ZStack {
                    MapView(region: $region, issMark: $issViewModel.currentData)
                    
                    VStack(alignment: .trailing, spacing: 10) {
                        if let aboardData = aboardDataViewModel.aboardData {
                            PeopleButton(aboard: aboardData)
                        }
                        Spacer()
                        FocusButton(region: $region, issData: issData)
                        PositionDetailsBar(issViewModel: issViewModel, issData: issData)
                    }
                    .padding([.top, .horizontal])
                    .padding(.bottom, 30)
                    
                }
                .onAppear {
                    region = MKCoordinateRegion(
                        center: CLLocationCoordinate2D(
                            latitude: issData.latitude,
                            longitude: issData.longitude
                        ),
                        span: MKCoordinateSpan(
                            latitudeDelta: 80,
                            longitudeDelta: 80
                        )
                    )
                }
                
            } else {
                ProgressView()
            }
        }
        .onAppear {
            aboardDataViewModel.getData()
            
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
                issViewModel.getData()
            }
            
//            // Test Data
//            issViewModel.currentData = [ISS(id: 25544, name: "iss", latitude: 50.11496269845, longitude: 118.07900427317, altitude: 408.05526028199, velocity: 27635.971970874)]
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
