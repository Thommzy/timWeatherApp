//
//  DataLoader.swift
//  weatherApp
//
//  Created by Tim on 14/09/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import Foundation


//MARK:- DATALOADER TO GET CURRENT WEATHER using PROTOCOLS



class DataLoader  {
    
    var loadWeatherDelegate : CurrentDataProtocols?
    
    func loadData() {
        let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
        let apiKey = "7a22797d0651a1c44a55227285888de5"
        let state = "Lagos"
        let weatherUrl = "\(baseUrl)?q=\(state)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: weatherUrl) else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
        if let data = data {
                do{
                    let jsonDecoder = JSONDecoder()
                    let dataFromJson =  try jsonDecoder.decode(WeatherData.self, from: data)
                    
                    self.loadWeatherDelegate?.fetchWeather(weather: dataFromJson)
                   }
            catch {
                
            }
          }
        }.resume()
    }
}


