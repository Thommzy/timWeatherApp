//
//  DataLoader.swift
//  weatherApp
//
//  Created by Tim on 14/09/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import Foundation

class DataLoader {
    func loadData(closure: @escaping (WeatherData) -> ()) {
        let weatherUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=osun&appid=7a22797d0651a1c44a55227285888de5"
        guard let url = URL(string: weatherUrl) else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
        if let response = response {
            print(">>>>>||>>>>", response)
        }
        if let data = data {
                do{
                    let jsonDecoder = JSONDecoder()
                    let dataFromJson =  try jsonDecoder.decode(WeatherData.self, from: data)
                       closure(dataFromJson)
                    print("json>>>>>", data)
                   }
            catch {
                print("error<<<<<<", error)
            }
          }
        }.resume()
    }
}
