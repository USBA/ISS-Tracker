//
//  OnBoardViewModel.swift
//  ISS Tracker
//
//  Created by Umayanga Alahakoon on 6/15/21.
//

import SwiftUI

class AboardDataViewModel: ObservableObject {
    @Published var aboardData: Aboard?
    
    func getData() {
        guard let url = URL(string: "http://api.open-notify.org/astros.json") else {
            return
        }
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        let task = URLSession(configuration: config).dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let abData = try JSONDecoder().decode(Aboard.self, from: data)
                DispatchQueue.main.async {
                    self.aboardData = abData
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
