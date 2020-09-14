//
//  DataLoader.swift
//  weatherApp
//
//  Created by Tim on 14/09/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import Foundation

class DataLoader {
    func loadData(closure: ([WeatherData]) -> ()) {
        guard let url = URL(string: "http://samples.openweathermap.org/data/2.5/weather?q=Newyork,us&appid=439d4b804bc8187953eb36d2a8c26a02") else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(">>>>>>>>>", response)
            }
            
            if let data = data {
                print("<<<<<<<<<", data)
            }
            
        }.resume()
    }
}
