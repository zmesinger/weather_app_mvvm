//
//  WeatherResponse.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 06.11.2023..
//

import Foundation

struct WeatherResponse: Decodable {
    var name: String
    var weatherDetails: [WeatherDetails]
    var main: MainResponse
    var wind: WindResponse
    var sys: SysResponse
    
    var weatherCondition: String {
        guard let firstWeather = weatherDetails.first else { return "cloud" }
        
        switch firstWeather.id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
        
    }
}
