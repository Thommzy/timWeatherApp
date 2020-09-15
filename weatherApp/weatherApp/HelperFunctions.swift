//
//  HelperFunctions.swift
//  weatherApp
//
//  Created by Tim on 15/09/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import Foundation

//MARK:- HELPER FUNCTION TO FILTER THE DAILY DATE AND TEMPERATURE
func filteredDateAndTemperature(_ weatherList: [DailyListTemperatue]) -> [(String, Double)] {
     var weatherTuple = [(String, Double)]()
     for weatherDetails in weatherList {
         if weatherDetails.dt_txt.contains("06:00:00") {
             weatherTuple.append((weatherDetails.dt_txt,weatherDetails.main.temp))
         }
     }
     return weatherTuple
  }
