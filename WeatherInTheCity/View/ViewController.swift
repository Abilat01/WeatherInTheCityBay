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
        @IBOutlet weak var pressureLabel: UILabel!
        
        var networkManager = NetworkMenager()
       
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            networkManager.delegate = self
            networkManager.fetchCurrentWeather(forCity: "Moscow")
            
        }
        
        @IBAction func searchPressed(_ sender: UIButton) {
            self.searchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { city in
                self.networkManager.fetchCurrentWeather(forCity: city)
            }
        }
        
    }
    
    extension ViewController: NetworkWeatherManagerDelegate {
        func updateInterface(_: NetworkMenager, with currentWeather: CurrentWeather) {
            print(currentWeather.cityName)
        }
    }
    
