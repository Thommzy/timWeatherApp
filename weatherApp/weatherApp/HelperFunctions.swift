//
//  HelperFunctions.swift
//  weatherApp
//
//  Created by Tim on 15/09/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import Foundation

//MARK:- HELPER FUNCTION TO FILTER THE DAILY DATE AND TEMPERATURE
func filteredDateAndTemperature(_ weatherList: [DailyListTemperatue]) -> [(String, Double, String)] {
     var weatherTuple = [(String, Double, String)]()
     for weatherDetails in weatherList {
         if weatherDetails.dt_txt.contains("06:00:00") {
            weatherTuple.append((weatherDetails.dt_txt,weatherDetails.main.temp, weatherDetails.weather[0].main))
         }
     }
     return weatherTuple
  }

//MARK:- HELPER FUNCTION TO CONVERT THE DATE TO DAY
func dateToDay(_ date: String) -> String {
    var dateString = ""
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "EEEE"
    
    if let date1 = dateFormatterGet.date(from: date) {
        let dateToDay = dateFormatterPrint.string(from: date1)
        dateString += "\(dateToDay)"
    } else {
        print("There was an error decoding the string")
    }
    return dateString
}
