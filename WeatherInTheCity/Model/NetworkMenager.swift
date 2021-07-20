//
//  NetworkMenager.swift
//  WeatherInTheCity
//
//  Created by Danya on 19.07.2021.
//

import Foundation

struct NetworkMenager {
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task =  session.dataTask(with: url) { data, response, error in
            if let data = data {
                self.parseJSON(withData: data)
                
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) {
        let decoder = JSONDecoder()
        do {
           let correntWeathData = try decoder.decode(CurrentWeatheData.self, from: data)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
    
}
