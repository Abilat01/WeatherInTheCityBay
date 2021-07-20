//
//  NetworkMenager.swift
//  WeatherInTheCity
//
//  Created by Danya on 19.07.2021.
//

import Foundation

protocol NetworkWeatherManagerDelegate {
    func updateInterface(_: NetworkMenager, with currentWeather: CurrentWeather)
}

struct NetworkMenager {
    
    var delegate: NetworkWeatherManagerDelegate?
    
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task =  session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.delegate?.updateInterface(self, with: currentWeather)
                }
                
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
           let currentWeathData = try decoder.decode(CurrentWeatheData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeathData) else { return nil }
           return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
