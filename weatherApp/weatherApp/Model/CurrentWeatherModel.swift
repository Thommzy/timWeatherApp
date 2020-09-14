//
//  CurrentWeatherModel.swift
//  weatherApp
//
//  Created by Tim on 14/09/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    var main : [MainData]
    var weather : [weatherType]
}


struct MainData: Codable {
    var temp_min : Double
    var temp_max : Double
    var temp : Double
}


struct weatherType: Codable {
    var main : String
}
