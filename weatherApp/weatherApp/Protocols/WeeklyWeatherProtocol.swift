//
//  WeeklyWeatherProtocol.swift
//  weatherApp
//
//  Created by Tim on 21/09/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import Foundation


protocol WeeklyDataProtocol {
    func fetchWeeklyWeather(weather : DaysWeather)
}
