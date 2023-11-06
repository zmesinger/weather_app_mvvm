//
//  ContentView.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 06.11.2023..
//

import SwiftUI
import CoreLocationUI

struct MainView: View {
    
    @StateObject var locationManager = LocationManager()
    private var weatherManager = WeatherManager()
    @State var weather: WeatherResponse?
    
    var body: some View {
        
        NavigationView {
            
            if let location = locationManager.locationCoordinates {
                if let weather = weather {
                    HomeView()
                } else {
                    LoadingView()
                        .task {
                            weatherManager.getWeather(for: location) { result in
                                switch result {
                                case .success(let weather):
                                    self.weather = weather
                                case .failure(let error):
                                    print("error while getting data, \(error)")
                                }
                            }
                        }
                }
            } else {
                if locationManager.isFetchingLocation {
                    LoadingView()
                } else {
                    StartView(locationManager: locationManager)
                }
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
