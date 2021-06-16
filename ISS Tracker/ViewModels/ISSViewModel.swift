//
//  ISSViewModel.swift
//  ISS Tracker
//
//  Created by Umayanga Alahakoon on 6/15/21.
//

import SwiftUI
import MapKit

class ISSViewModel: ObservableObject {
    @Published var currentData = [ISS]()
    
    func getData() {
        guard let url = URL(string: "https://api.wheretheiss.at/v1/satellites/25544") else {
            DispatchQueue.main.async {
            }
            return
        }
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            print("Checked ISS data at... \(Date()))")
            
            let task = URLSession(configuration: config).dataTask(with: url) { data, response, error in
                guard let data = data else {
                    return
                }
                do {
                    let issData = try JSONDecoder().decode(ISS.self, from: data)
                    DispatchQueue.main.async {
                        withAnimation {
                            self.currentData = [issData]
                        }
                    }
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
    }
    
}
