//
//  WeatherView.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 09.11.2023..
//

import SwiftUI

struct WeatherView: View {
    @State var weatherManager: WeatherManager
    @State var locationManager: LocationManager
    @State var weather: WeatherResponse?
    @State var isAnimating: Bool = false
    @State var searchString: String = ""
    @State var invalidTownName: Bool = false
    @State var isDetailsPresented: Bool = false
    @State var forecast: ForecastResponse?
    
    var body: some View {
        
        
        
        GeometryReader { _ in
            VStack {
     
                           TextField("Start typing", text: $searchString, onCommit: performSearch)
                           .foregroundColor(.accentColor)
                           .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                           .background(RoundedRectangle(cornerRadius: 8).fill(darkBlue)
                                .frame(height: 40))
                               .overlay(alignment: .trailing) {
                                   Button(action: performSearch) {
                                       Image(systemName: "magnifyingglass")
                                           .padding(.trailing, 8)
                                   }
                               }
                               .padding(8)
                               .alert("Please enter valid town name", isPresented: $invalidTownName) {
                                   Text("OK")
                               }
                               
                Spacer()

                if weather != nil {
                    
                    
                    VStack {
                    
                    
                    Text("\(weather!.name), \(weather!.sys.country)")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                    
                    Image(systemName: weather!.weatherCondition)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.white)
                    
                    Text(Date(), style: .date)
                        .foregroundColor(.white)
                        .font(.title2)
                    
                    Text("\(weather!.main.temp.roundDouble())°")
                        .foregroundColor(.white)
                        .font(.system(size: 72))
                        .bold()
                        .padding(.vertical, 2)
                        HStack {
                            
                            
                            
                            Image(systemName: "thermometer")
                                .foregroundColor(.white)
                            Text("Feels like: \(weather!.main.feelsLike.roundDouble())°")
                            .foregroundColor(.white)
                            .font(.title2)
  
                        }
                    
                    
                    Divider()
                        .frame(height: 2)
                        .overlay(.white)
                        .padding(.horizontal, 12)
                        .cornerRadius(10)
                    
                    
                        Grid(alignment: .center, horizontalSpacing: 48, verticalSpacing: 24) {
                            
                            GridRow {
                                WeatherDetailsItem(symbolName: "wind", value: "\(weather!.wind.speed.roundDouble())m/s", itemName: "Wind")
                                WeatherDetailsItem(symbolName: "thermometer", value: "\(weather!.main.tempMin.roundDouble())°/\(weather!.main.tempMax.roundDouble())°", itemName: "Min/Max")
                            }
                            
                            GridRow {
                                WeatherDetailsItem(symbolName: "barometer", value: "\((weather!.main.pressure).roundDouble()) Bar", itemName: "Pressure")
                                WeatherDetailsItem(symbolName: "humidity", value: "\(weather!.main.humidity.roundDouble())%", itemName: "Humidity")
                            }
                            
                            
                            HStack {
                                
                                GridRow(alignment: .center) {
                                    
                                    Button {
                                        isDetailsPresented = true
                                    } label: {
                                        Image(systemName: "chevron.up")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 24, height: 24)
                                            .foregroundColor(.accentColor)
                                            
                                    }
                                    .buttonStyle(.bordered)
                                    .cornerRadius(24)
                                    
                                }
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            
                
                        }
                        .padding(.top, 24)
                        
                        Spacer()
                    
                }
                    .padding(.top, 32)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : -40)
                    .animation(.easeOut, value: isAnimating)
                    .onAppear {
                        isAnimating = true
                    }
                    .gesture(DragGesture()
                        .onEnded({ value in
                            let direction = self.detectDirection(value: value)
                            if direction == .up {
                                
                                isDetailsPresented = true
                            }
                            
                        })
                    )
                    .sheet(isPresented: $isDetailsPresented) {
                        
                        if let forecast = forecast {
                            WeatherDetailsView(forecast: forecast)
                        } else {
                            LoadingView()
                                .transition(.slide)
                                .task {
                                    weatherManager.getForecast(for: locationManager.locationCoordinates!) { result in
                                        switch result {
                                        case .success(let forecast):
                                            self.forecast = forecast
                                        case .failure(let error):
                                            print("error while getting data, \(error)")
                                        }
                                    }
                                }
                        }
                    }
            }
                else {
                    ViewThatFits(in: .horizontal) {
                        Text("Search for town")
                            .padding(.all, 8)
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : -40)
                    .animation(.easeOut, value: isAnimating)
                    .onAppear {
                        isAnimating = true
                    }
                    Spacer()
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.linearGradient(colors: [diamondBlue, .blue, darkBlue ], startPoint: .topLeading, endPoint: .bottomTrailing))
        
        }.ignoresSafeArea(.keyboard)
        
    }
    
    func detectDirection(value: DragGesture.Value) -> SwipeHVDirection {
        
        switch(value.translation.width, value.translation.height) {
            case (...0, -30...30):
            return .left
            case (0..., -30...30):
            return .right
            case (-100...100, ...0):
            return .up
            case (-100...100, 0...):
            return .down
            default:
            return .none
            
        }
        
        
    }
    
    private func performSearch() {
        weatherManager.getWeather(town: searchString) { result in
            switch result {
            case .success(let weather):
                self.weather = weather
            case .failure(let error):
                print("error while getting data, \(error)")
                invalidTownName = true
            }
        }
    }
    
}

