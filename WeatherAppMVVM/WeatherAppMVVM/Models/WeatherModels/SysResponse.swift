//
//  SysResponse.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 06.11.2023..
//

import Foundation

struct SysResponse: Decodable {
    var country: String
    var sunrise: Int
    var sunset: Int
}
