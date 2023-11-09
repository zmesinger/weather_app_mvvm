//
//  LoadingView.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 06.11.2023..
//

import SwiftUI

struct LoadingView: View {
    
    
    
    var body: some View {
        ZStack {
            
            
            LoadingComponent()

            
            VStack {
                
                Text("Fetching location...")
                    .font(.title2)
            
                
            }
            .multilineTextAlignment(.center)
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
