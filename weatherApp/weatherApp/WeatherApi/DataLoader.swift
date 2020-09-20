//
//  DataLoader.swift
//  weatherApp
//
//  Created by Tim on 14/09/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import Foundation


//MARK:- DATALOADER TO GET CURRENT WEATHER
class DataLoader {
    func loadData(closure: @escaping (WeatherData) -> ()) {
        let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
        let apiKey = apiKeys().returnAiKey()
        let state = "Kebbi"
        let weatherUrl = "\(baseUrl)?q=\(state)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: weatherUrl) else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
        if let data = data {
                do{
                    let jsonDecoder = JSONDecoder()
                    let dataFromJson =  try jsonDecoder.decode(WeatherData.self, from: data)
                       closure(dataFromJson)
                   }
            catch {
                print("kdjjd",error)
            }
          }
        }.resume()
    }
}



