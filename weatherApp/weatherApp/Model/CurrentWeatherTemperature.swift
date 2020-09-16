//
//  CurrentWeatherTemperature.swift
//  weatherApp
//
//  Created by Tim on 14/09/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import Foundation


struct currentWeatherTemperature: Codable {
    let temp, minimumTemperature, maximumTemperature: Double
    
    private enum CodingKeys: String, CodingKey {
        case minimumTemperature = "temp_min"
        case maximumTemperature = "temp_max"
        case temp
    }
}


