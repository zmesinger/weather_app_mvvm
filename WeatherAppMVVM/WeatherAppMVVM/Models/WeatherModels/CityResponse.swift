//
//  CityResponse.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 10.11.2023..
//

import Foundation

struct CityResponse: Decodable {
    var id: Int
    var name: String
    var country: String
    var population: Int
    var sunrise: Int
    var sunset: Int
}
