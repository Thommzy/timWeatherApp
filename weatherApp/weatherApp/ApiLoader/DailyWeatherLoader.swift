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
    
    var loadWeeklyDelegate : WeeklyDataProtocol?
    
    func loadDaysData() {
               let baseUrl = "https://api.openweathermap.org/data/2.5/forecast"
               let apiKey = "7a22797d0651a1c44a55227285888de5"
               let state = "Osun"
               let weatherUrl = "\(baseUrl)?q=\(state)&appid=\(apiKey)&units=metric"
               guard let url = URL(string: weatherUrl) else {return}
               let session = URLSession.shared
               session.dataTask(with: url) { (data, response, error) in
               if let data = data {
                   do{
                       let jsonDecoder = JSONDecoder()
                       let dataFromJson =  try jsonDecoder.decode(DaysWeather.self, from: data)
                       self.loadWeeklyDelegate?.fetchWeeklyWeather(weather: dataFromJson)
                      }
                   catch {
                    print(error)
                   }
                 }
               }.resume()
       }
}
