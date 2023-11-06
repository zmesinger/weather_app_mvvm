//
//  StartView.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 06.11.2023..
//

import SwiftUI
import CoreLocationUI

struct StartView: View {
    
    @State private var isAnimating: Bool = false
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        ZStack {
                BlobShape()
                    .frame(width: 425, height: 400)
                    .foregroundStyle(.linearGradient(colors: [.orange, .red],
                                                     startPoint: .topLeading,
                                                     endPoint: .bottomTrailing))
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 20 : -40)
                    .animation(.easeOut(duration: 4), value: isAnimating)
                
                
                VStack {
                    
    
                    VStack {
                        Text("No location")
                            .bold()
                            .font(.title)
                
                        Text("Share your location to find weather for your current locaion ")
                            .padding()
                            
                    }
                    .multilineTextAlignment(.center)
                    
                    LocationButton(.shareCurrentLocation) {
                        locationManager.fetchLocation()
                        
                    }
                    .foregroundStyle(.white)
                    .cornerRadius(16)
                    .symbolVariant(.fill)
                }
                
            }
            .onAppear {
                isAnimating = true
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Skip")
                        Image(systemName: "arrow.forward")
                    }


                }
            }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
