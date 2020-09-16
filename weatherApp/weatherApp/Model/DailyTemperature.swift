//
//  DailyTemperature.swift
//  weatherApp
//
//  Created by Tim on 15/09/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import Foundation


struct DailyListTemperatue : Codable {
    let date : String
    let main : MainTemperature
    let weather : [Weather]
    
    private enum CodingKeys: String, CodingKey {
        case date = "dt_txt"
        case main, weather
    }
}

struct MainTemperature : Codable {
    let temp : Double
}

struct Weather : Codable {
    let main : String
}
