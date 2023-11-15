//
//  HomeView.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 06.11.2023..
//

import SwiftUI

struct HomeView: View {
    @State var weather: WeatherResponse?
    @State var weatherManager: WeatherManager
    @State var locationManager: LocationManager
    var body: some View {
        TabView {
            WeatherView(weatherManager: weatherManager, locationManager: locationManager, weather: weather)
                .tabItem {
                    Label("Weather", systemImage: "smoke")
                        .foregroundColor(.white)
                }
                
        }
        .toolbarColorScheme(.light, for: .tabBar)
    }
}


