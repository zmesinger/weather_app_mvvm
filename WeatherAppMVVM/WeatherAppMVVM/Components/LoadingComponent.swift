//
//  LoadingComponent.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 09.11.2023..
//

import SwiftUI

struct LoadingComponent: View {
    
    @State var isRotating = false
    
    var body: some View {
        
        ViewThatFits {
            ZStack {
             
                        Circle()
                            .stroke(Color(.systemGray5), lineWidth: 14)
                            
             
                        Circle()
                            .trim(from: 0, to: 0.2)
                            .stroke(Color.accentColor, lineWidth: 7)
                            .rotationEffect(Angle(degrees: isRotating ? 360 : 0))
                            .onAppear() {
                                withAnimation(.linear(duration: 1).speed(0.7).repeatForever(autoreverses: false)) {
                                    self.isRotating = true
                                }
                                
                            }
                
            }
            .padding()
        }
        
    }
}

struct LoadingComponent_Previews: PreviewProvider {
    static var previews: some View {
        LoadingComponent()
    }
}
