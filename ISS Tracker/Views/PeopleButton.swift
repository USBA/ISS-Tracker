//
//  PeopleButton.swift
//  ISS Tracker
//
//  Created by Umayanga Alahakoon on 6/15/21.
//

import SwiftUI
import MapKit

struct PeopleButton: View {
    var aboard: Aboard

    var body: some View {
        Menu {
            Text("People aboard the ISS")
            Divider()
            ForEach(aboard.people, id: \.self) { person in
                Text(person.name)
            }
        } label: {
            Label(aboard.number.formatted(), systemImage: "person.2.fill")
                .foregroundColor(.secondary)
                .padding(10)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}
