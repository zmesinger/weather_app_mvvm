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
    var body: some View {
        TabView {
            WeatherView(weatherManager: weatherManager, weather: weather)
                .tabItem {
                    Label("Weather", systemImage: "smoke")
                        .foregroundColor(.white)
                }
                
        }
        .toolbarColorScheme(.light, for: .tabBar)
    }
}


