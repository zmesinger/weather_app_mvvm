//
//  WeatherDetails.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 06.11.2023..
//

import Foundation

struct WeatherDetails: Decodable {
    var id: Double
    var main: String
    var description: String
    var icon: String
}
