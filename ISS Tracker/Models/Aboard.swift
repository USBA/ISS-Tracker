//
//  Aboard.swift
//  ISS Tracker
//
//  Created by Umayanga Alahakoon on 6/15/21.
//

import SwiftUI

struct Aboard: Codable {
    var message: String
    var number: Int
    var people: [Person]
}

struct Person: Codable, Hashable {
    var name: String
}
