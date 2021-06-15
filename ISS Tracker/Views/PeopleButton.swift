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
    
    func peopleAboardISS() -> [Person] {
        return aboard.people.filter({ $0.craft.lowercased() == "ISS".lowercased() })
    }

    var body: some View {
        Menu {
            Text("People aboard the ISS")
            Divider()
            ForEach(peopleAboardISS(), id: \.self) { person in
                Text(person.name)
            }
        } label: {
            if #available(iOS 15.0, *) {
                Label(peopleAboardISS().count.formatted(), systemImage: "person.2.fill")
                    .foregroundColor(.secondary)
                    .padding(10)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } else {
                // Fallback on earlier versions
                Label("\(peopleAboardISS().count)", systemImage: "person.2.fill")
                    .foregroundColor(.secondary)
                    .padding(10)
                    .background(BlurView(effect: .systemMaterial))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}
