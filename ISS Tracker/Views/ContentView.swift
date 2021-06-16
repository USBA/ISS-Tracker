//
//  ContentView.swift
//  ISS Tracker
//
//  Created by Umayanga Alahakoon on 6/15/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    @ObservedObject var issViewModel = ISSViewModel()
    @ObservedObject var aboardDataViewModel = AboardDataViewModel()
    
    @State var region = MKCoordinateRegion()
    
    var body: some View {
        VStack {
            if let issData = issViewModel.currentData.first {
                
                ZStack {
                    MapView(region: $region, issMark: $issViewModel.currentData)
                    
                    VStack(alignment: .trailing, spacing: 10) {
                        HStack {
                            AboutMenu()
                            Spacer()
                            if let aboardData = aboardDataViewModel.aboardData {
                                PeopleButton(aboard: aboardData)
                            }
                        }
                        Spacer()
                        FocusButton(region: $region, issData: issData)
                        PositionDetailsBar(issViewModel: issViewModel, issData: issData)
                    }
                    .padding([.top, .horizontal])
                    .padding(.bottom, 30)
                    
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .active {
                        setTheRegionOnActive(issData: issData)
                    }
                }
                .onAppear {
                    setTheRegionOnAppear(issData: issData)
                }
                
            } else {
                LoadingView()
            }
        }
        .onAppear {
            getData()
        }
    }
    
    func getData() {
        aboardDataViewModel.getData()
        issViewModel.getData()
        
        //// Use Test Data
        //loadTestData()
    }
    
    func loadTestData() {
        // Test Data
        issViewModel.currentData = [ISS(id: 25544, name: "iss", latitude: 50.11496269845, longitude: 118.07900427317, altitude: 408.05526028199, velocity: 27635.971970874)]
        
        let person1 = Person(name: "Edward Boldwin", craft: "ISS")
        let person2 = Person(name: "Gordo Stevens", craft: "ISS")
        let person3 = Person(name: "Danielle Poole", craft: "ISS")
        let people : [Person] = [person1, person2, person3]
        aboardDataViewModel.aboardData = Aboard(message: "People on ISS", number: 3, people: people)
    }
    
    func setTheRegionOnAppear(issData: ISS) {
        withAnimation {
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
    }
    
    func setTheRegionOnActive(issData: ISS) {
        withAnimation {
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: issData.latitude,
                    longitude: issData.longitude
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: region.span.latitudeDelta > 80 ? 80 : region.span.latitudeDelta < 30 ? 30 : region.span.latitudeDelta,
                    longitudeDelta: region.span.longitudeDelta > 80 ? 80 : region.span.longitudeDelta < 30 ? 30 :region.span.longitudeDelta
                )
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
