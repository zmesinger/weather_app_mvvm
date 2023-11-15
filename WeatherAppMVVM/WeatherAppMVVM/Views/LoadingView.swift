//
//  LoadingView.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 06.11.2023..
//

import SwiftUI

struct LoadingView: View {
    
    @State var isAnimating: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                LoadingComponent()
                VStack {
                    
                    Text("Fetching...")
                        .foregroundColor(.white)
                        .font(.title2)
                
                    
                }
                .multilineTextAlignment(.center)
            }
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : -40)
            .animation(.easeOut, value: isAnimating)
            .onAppear {
                isAnimating = true
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.linearGradient(colors: [diamondBlue, .blue, darkBlue ], startPoint: .topLeading, endPoint: .bottomTrailing))
        
        
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
