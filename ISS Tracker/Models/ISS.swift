//
//  ISS.swift
//  ISS Tracker
//
//  Created by Umayanga Alahakoon on 6/15/21.
//

import SwiftUI
import MapKit

struct ISS: Codable, Identifiable {
    var id: Int
    var name: String
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    var altitude: CLLocationDegrees
    var velocity: Double
}
