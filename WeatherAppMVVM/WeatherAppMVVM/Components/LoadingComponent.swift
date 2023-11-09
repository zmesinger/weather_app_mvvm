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
        
        ZStack {
         
                    Circle()
                        .stroke(Color(.systemGray5), lineWidth: 14)
                        .frame(width: 400, height: 400)
         
                    Circle()
                        .trim(from: 0, to: 0.2)
                        .stroke(Color.orange, lineWidth: 7)
                        .frame(width: 400, height: 400)
                        .rotationEffect(Angle(degrees: isRotating ? 360 : 0))
                        .onAppear() {
                            withAnimation(.linear(duration: 1).speed(0.7).repeatForever(autoreverses: false)) {
                                self.isRotating = true
                            }
                            
                        }
            
        }
        
    }
}

struct LoadingComponent_Previews: PreviewProvider {
    static var previews: some View {
        LoadingComponent()
    }
}
