//
//  ViewController.swift
//  weatherApp
//
//  Created by Tim on 13/09/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var data = [WeatherData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //DataLoader.loadData(<#T##self: DataLoader##DataLoader#>)
        DataLoader().loadData(closure: { (book) in
            data = book
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherListCell", for: indexPath)
        return cell
    }
}

