    //
//  ViewController.swift
//  WeatherInTheCity
//
//  Created by Danya on 17.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherIconImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    let networkManager = NetworkMenager()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.fetchCurrentWeather(forCity: "Moscow")
        
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        self.searchAlertController(withTitle: "Enter city name", message: nil, style: .alert)
    }
    
}

