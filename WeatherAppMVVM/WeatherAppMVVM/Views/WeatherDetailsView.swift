//
//  WeatherDetailsView.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 10.11.2023..
//

import SwiftUI

struct WeatherDetailsView: View {
    @State var forecast: ForecastResponse
    let dateFormatter = DateFormatter()
    
    func getFormattedDate(_ dateInInt: Int) -> String {
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(dateInInt)))

    }
    
    func getFutureDate(_ days: Int) -> String {
        let currentDate = Date()
        var dateComponent = DateComponents()
        dateComponent.day = 1
        
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)!
        
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateFormatter.string(from: futureDate)
        
        
    }
    
    var body: some View {
        
        
        ScrollView {
            
            Text("Weather forecast")
                .foregroundColor(.white)
                .font(.title3)
                .padding()
                
            ForEach(forecast.list, id: \.dt) { forecast in
                
                
                
                if getFormattedDate(forecast.dt) == Date.getCurrentDate() {
                    HStack (alignment: .center ,spacing: 60) {
                        Text(Date(timeIntervalSince1970: TimeInterval(forecast.dt )), style: .date)
                            .foregroundColor(.white)
                            .padding()
                        
                        
                        Image(systemName: forecast.weatherCondition)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            
                        
                        Text("\(forecast.main.tempMin.roundDouble())°/\(forecast.main.tempMax.roundDouble())°")
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                
                
            }
            
            Divider()
                .frame(height: 2)
                .overlay(.white)
                .padding(.horizontal, 12)
                .cornerRadius(10)
            
                
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.linearGradient(colors: [diamondBlue, .blue, darkBlue ], startPoint: .topLeading, endPoint: .bottomTrailing))
        
    }
}


