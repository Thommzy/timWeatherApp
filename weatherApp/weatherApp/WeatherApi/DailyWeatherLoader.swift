//
//  DailyWeatherLoader.swift
//  weatherApp
//
//  Created by Tim on 15/09/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import Foundation

//MARK:- DATALOADER TO GET THE DAILY WEATHER
class DailyWeatherLoader {
    func loadDaysData(closure: @escaping (DaysWeather) -> ()) {
               let baseUrl = "https://api.openweathermap.org/data/2.5/forecast"
               let apiKey = "7a22797d0651a1c44a55227285888de5"
               let state = "Sokoto"
               let weatherUrl = "\(baseUrl)?q=\(state)&appid=\(apiKey)"
               guard let url = URL(string: weatherUrl) else {return}
               let session = URLSession.shared
               session.dataTask(with: url) { (data, response, error) in
               if let data = data {
                   do{
                       let jsonDecoder = JSONDecoder()
                       let dataFromJson =  try jsonDecoder.decode(DaysWeather.self, from: data)
                          closure(dataFromJson)
                      }
                   catch {
                       print(error)
                   }
                 }
               }.resume()
       }
}
