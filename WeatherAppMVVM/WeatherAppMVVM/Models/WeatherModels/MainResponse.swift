//
//  MainResponse.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 06.11.2023..
//

import Foundation


struct MainResponse: Decodable {
    
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Double
    var humidity: Double
    
    var feelsLike: Double {
        return feels_like
    }
    
    var tempMin: Double {
        return temp_min
    }
    
    var tempMax: Double {
        return temp_max
    }
    
}
