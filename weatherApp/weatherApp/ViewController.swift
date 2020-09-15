//
//  ViewController.swift
//  weatherApp
//
//  Created by Tim on 13/09/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var WeatherBackgroundImage: UIImageView!
    @IBOutlet weak var WeatherTemperatureLabel: UILabel!
    @IBOutlet weak var WeatherDescriptionLabel: UILabel!
    @IBOutlet weak var MinimumTemperatureLabel: UILabel!
    @IBOutlet weak var MaximumTemperatureLabel: UILabel!
    @IBOutlet weak var CurrentTemperatureLabel: UILabel!
    var data : WeatherData?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        DataLoader().loadData(closure: { (weather) in
            self.data = weather
            self.loadCurrentData()
        })
    }
    
    func loadCurrentData() {
        let queue = DispatchQueue(label: "")
           queue.async {
            DispatchQueue.main.async {
               if let data =  self.data {
                   let kelvinConstant  = 273.15
                   let currenTemperature = data.main.temp
                   let minimumTemperature = data.main.temp_min
                   let maximumTemperature = data.main.temp_max
                   let currentValue = String(format: "%.0f", currenTemperature - kelvinConstant)
                   let minimumValue = String(format: "%.0f", minimumTemperature - kelvinConstant)
                   let maximumValue = String(format: "%.0f", maximumTemperature - kelvinConstant)
                   let weatherType = data.weather.map{$0.main}[0]
                   self.MinimumTemperatureLabel.text = "\(minimumValue)°"
                   self.WeatherTemperatureLabel.text = "\(currentValue)°"
                   self.CurrentTemperatureLabel.text = "\(currentValue)°"
                   self.MaximumTemperatureLabel.text = "\(maximumValue)°"
                   self.WeatherTemperatureLabel.font = self.WeatherTemperatureLabel.font.withSize(45)
                   self.WeatherDescriptionLabel.text = weatherType
                   self.WeatherDescriptionLabel.font = self.WeatherDescriptionLabel.font.withSize(35)
                   let cloudyColor = #colorLiteral(red: 0.3294117647, green: 0.4431372549, blue: 0.4784313725, alpha: 1)
                   let rainyColor = #colorLiteral(red: 0.3411764706, green: 0.3411764706, blue: 0.3647058824, alpha: 1)
                   if weatherType == "Clouds" {
                        self.WeatherBackgroundImage.image = UIImage(named: ("forest_cloudy"))
                        self.view.backgroundColor = cloudyColor
                    }
                    if weatherType == "Rain" || weatherType == "Thunderstorm" {
                        self.WeatherBackgroundImage.image = UIImage(named: ("forest_rainy"))
                        self.view.backgroundColor = rainyColor
                    }
               }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherListCell", for: indexPath)
        return cell
    }
}

