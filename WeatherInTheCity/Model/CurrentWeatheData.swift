//
//  CurrentWeatheData.swift
//  WeatherInTheCity
//
//  Created by Danya on 20.07.2021.
// туть будем парсить данные, ух какие умные слова пошли

import Foundation

struct CurrentWeatheData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let pressure: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case pressure
    }
}

struct Weather: Codable {
    let id: Int
}
