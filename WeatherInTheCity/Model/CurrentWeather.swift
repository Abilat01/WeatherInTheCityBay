//
//  CurrentWeather.swift
//  WeatherInTheCity
//
//  Created by Danya on 20.07.2021.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        return "\(temperature.rounded())"
    }
    
    let pressure: Double
    var pressureString: String {
        return "\(pressure.rounded())"
    }
    
    let conditionCode: Int
    
    init?(currentWeatherData: CurrentWeatheData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        pressure = currentWeatherData.main.pressure
        conditionCode = currentWeatherData.weather.first!.id
    }
}
