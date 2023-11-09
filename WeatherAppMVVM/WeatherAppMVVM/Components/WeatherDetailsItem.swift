//
//  WeatherDetailsItem.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 09.11.2023..
//

import SwiftUI

struct WeatherDetailsItem: View {
    @State var symbolName: String
    @State var value: String
    @State var itemName: String

    
    var body: some View {
        HStack {
            Image(systemName: symbolName)
                .resizable()
                .scaledToFit()
                .frame(width: 42, height: 42)
                .foregroundColor(.white)

            VStack(alignment: .leading) {
                Text(value)
                    .foregroundColor(.white)
                Text(itemName)
                    .foregroundColor(.white)
                    
            }
            
            
        }
        
    }
}

struct WeatherDetailsItem_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailsItem(symbolName: "cloud.rain", value: "74%", itemName: "Chance of rain")
    }
}
