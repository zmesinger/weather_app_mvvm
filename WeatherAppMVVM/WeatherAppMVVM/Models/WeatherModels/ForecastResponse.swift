//
//  ForecastResponse.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 10.11.2023..
//

import Foundation

struct ForecastResponse: Decodable {
    var list: [WeatherForecast]
    var city: CityResponse
    
}
