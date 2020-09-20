//
//  ViewController.swift
//  weatherApp
//
//  Created by Tim on 13/09/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var weatherBackgroundImage: UIImageView!
    @IBOutlet weak var weatherTemperatureLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var minimumTemperatureLabel: UILabel!
    @IBOutlet weak var maximumTemperatureLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    
    var data : WeatherData?
    var dailyData : [(String, Double, String)] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentDefaults()
        self.loadCurrentData()
        self.tableData()
        
        DataLoader().loadData(closure: { (weather) in
            self.data = weather
            self.loadCurrentData()
            if let encoded = try? JSONEncoder().encode(weather) {
                UserDefaults.standard.set(encoded, forKey: "currentData")
            }
        })
        
        
        DailyWeatherLoader().loadDaysData(closure: { (weather) in
            self.dailyData = filteredDateAndTemperature(weather.list)
            self.reloadTableView()
            if let encoded = try? JSONEncoder().encode(weather) {
                UserDefaults.standard.set(encoded, forKey: "tableData")
            }
        })
    }
    
    func currentDefaults() {
        DispatchQueue.main.async {
            if let loadData = UserDefaults.standard.data(forKey: "currentData"),
                let data = try? JSONDecoder().decode(WeatherData.self, from: loadData) {
                self.data = data
            }
        }
    }
    
    func tableData() {
              DispatchQueue.main.async {
                  if let loadData = UserDefaults.standard.data(forKey: "tableData"),
                   let data = try? JSONDecoder().decode(DaysWeather.self, from: loadData) {
                   self.dailyData = filteredDateAndTemperature(data.list)
                   self.reloadTableView()
                  }
              }
          }
    
 
    
    func loadCurrentData() {
        let queue = DispatchQueue(label: "")
           queue.async {
            DispatchQueue.main.async {
             
               if let data =  self.data {
               
               let currenTemperature = data.main.temp
               let minimumTemperature = data.main.minimumTemperature
               let maximumTemperature = data.main.maximumTemperature
               let currentValue = String(format: "%.0f", currenTemperature)
               let minimumValue = String(format: "%.0f", minimumTemperature)
               let maximumValue = String(format: "%.0f", maximumTemperature)
               let weatherType = data.weather.map{$0.main}[0]
               self.minimumTemperatureLabel.text = "\(minimumValue)°"
               self.weatherTemperatureLabel.text = "\(currentValue)°"
               self.currentTemperatureLabel.text = "\(currentValue)°"
               self.maximumTemperatureLabel.text = "\(maximumValue)°"
               self.weatherTemperatureLabel.font = self.weatherTemperatureLabel.font.withSize(45)
               self.weatherDescriptionLabel.text = weatherType
               self.weatherDescriptionLabel.font = self.weatherDescriptionLabel.font.withSize(35)
               self.switchImageAndColor()
               }
               
            }
        }
    }
    
    func switchImageAndColor() {
        if let data = self.data {
            let cloudyColor = #colorLiteral(red: 0.3294117647, green: 0.4431372549, blue: 0.4784313725, alpha: 1)
            let rainyColor = #colorLiteral(red: 0.3411764706, green: 0.3411764706, blue: 0.3647058824, alpha: 1)
            let weatherType = data.weather.map{$0.main}[0]
                if weatherType == "Clouds" {
                    self.weatherBackgroundImage.image = UIImage(named: ("forest_cloudy"))
                    self.view.backgroundColor = cloudyColor
                }
                if weatherType == "Rain" || weatherType == "Thunderstorm" {
                    self.weatherBackgroundImage.image = UIImage(named: ("forest_rainy"))
                    self.view.backgroundColor = rainyColor
               }
        }
    }
    
    func reloadTableView()  {
        DispatchQueue.main.async {
            self.weatherTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dailyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherListCell", for: indexPath) as? WeatherTableViewCell else {
                   fatalError("Unable to dequeue weatherListCell.")
               }
        let indexData = self.dailyData[indexPath.row]
        cell.daysLabel.text = dateToDay(indexData.0)
        cell.daysTemperatureLabel.text = String(format: "%.0f" + "°", (indexData.1))
        cell.daysWeatherIcon.image = indexData.2 == "Rain" ? UIImage(named: ("rain")) : indexData.2 == "Clouds" || indexData.2 == "Mist" ? UIImage(named: ("partlysunny")) : UIImage(named: ("clear"))
        return cell
    }
}

