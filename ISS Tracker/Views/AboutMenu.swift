//
//  AboutMenu.swift
//  ISS Tracker
//
//  Created by Umayanga Alahakoon on 6/16/21.
//

import SwiftUI

struct AboutMenu: View {
    let sourceCodeURL = URL(string: "https://github.com/USBA/ISS-Tracker")!
    let whereTheISSAtURL = URL(string: "https://wheretheiss.at/w/developer")!
    let openNotifyURL = URL(string: "http://open-notify.org/Open-Notify-API/")!
    let creatorTwitterURL = URL(string: "https://twitter.com/usbakon")!
    
    var body: some View {
        Menu {
            Link(destination: sourceCodeURL) {
                Label("Cource Code", systemImage: "archivebox")
            }
            
            Menu {
                Link(destination: whereTheISSAtURL) {
                    Label("Where the ISS at?", systemImage: "arrow.up.right")
                }
                Link(destination: openNotifyURL) {
                    Label("Open Notify", systemImage: "arrow.up.right")
                }
            } label: {
                Label("Used APIs", systemImage: "waveform")
            }
            
            Divider()
            
            Link(destination: creatorTwitterURL) {
                Label("Creator", systemImage: "mustache")
            }
            
        } label: {
            if #available(iOS 15.0, *) {
                Image(systemName: "ellipsis")
                    .imageScale(.large)
                    .foregroundStyle(.secondary)
                    .padding(10)
            } else {
                // Fallback on earlier versions
                Image(systemName: "ellipsis")
                    .imageScale(.large)
                    .foregroundColor(.secondary)
                    .padding(10)
            }
        }

    }
}

struct AboutMenu_Previews: PreviewProvider {
    static var previews: some View {
        AboutMenu()
    }
}
