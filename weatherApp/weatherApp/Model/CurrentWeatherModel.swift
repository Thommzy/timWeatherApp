//
//  CurrentWeatherModel.swift
//  weatherApp
//
//  Created by Tim on 14/09/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    var main : currentWeatherTemperature
    var weather : [CurrentWeatherType]
}



