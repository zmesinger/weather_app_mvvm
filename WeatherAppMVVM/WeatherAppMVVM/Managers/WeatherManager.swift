//
//  WeatherManager.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 06.11.2023..
//

import Foundation
import CoreLocation

class WeatherManager {
    private let apiKey = "d9e73e548ce3121738cf343e9ecf3802"
    
    func getForecast(for coordinates: CLLocationCoordinate2D, completion: @escaping (Result<ForecastResponse, WeatherError>) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(apiKey)&units=metric")
        else {
            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                
                completion(.failure(.dataError))
                return
            }
            
            do {
                
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: data)
    
                completion(.success(forecastResponse))
            } catch {

                completion(.failure(.dataError))
            }
        }.resume()
    }
    
    func getWeather(for coordinates: CLLocationCoordinate2D, completion: @escaping (Result<WeatherResponse, WeatherError>) -> Void) {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(apiKey)&units=metric")
        else {
            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
               
                completion(.failure(.dataError))
                return
            }
            
            do {
                
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(.success(weatherResponse))
            } catch {
                
                completion(.failure(.dataError))
            }
        }.resume()
        
    }
    
    func getWeather(town: String, completion: @escaping (Result<WeatherResponse, WeatherError>) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(town)&appid=\(apiKey)&units=metric") else {

            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.dataError))
                return
            }
            
            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(.success(weatherResponse))
            } catch {
                completion(.failure(.dataError))
            }
        }.resume()
        
    }
    
}


