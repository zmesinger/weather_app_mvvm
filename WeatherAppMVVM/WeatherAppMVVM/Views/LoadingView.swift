//
//  LoadingView.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 06.11.2023..
//

import SwiftUI

struct LoadingView: View {
    
    @State var isRotating = 0.0
    
    var body: some View {
        ZStack {
            
            Image("loading_frame")
                .resizable()
                .frame(width: 400, height: 400)
                .rotationEffect(.degrees(isRotating))
                .onAppear {
                    withAnimation(.linear(duration: 1).speed(0.1).repeatForever(autoreverses: false)) {
                        isRotating = 360
                    }
                }
            
            VStack {
                
                Text("Fetching location...")
                    .font(.title2)
            
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
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
