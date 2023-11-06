//
//  BlobShape.swift
//  WeatherAppMVVM
//
//  Created by MacBookProAtos on 06.11.2023..
//

import Foundation
import SwiftUI

struct BlobShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.53101*width, y: 0.05089*height))
        path.addCurve(to: CGPoint(x: 0.71219*width, y: 0.07369*height), control1: CGPoint(x: 0.59194*width, y: 0.06038*height), control2: CGPoint(x: 0.65084*width, y: 0.06793*height))
        path.addCurve(to: CGPoint(x: 0.97986*width, y: 0.09299*height), control1: CGPoint(x: 0.8024*width, y: 0.08215*height), control2: CGPoint(x: 0.92378*width, y: 0.01788*height))
        path.addCurve(to: CGPoint(x: 0.93597*width, y: 0.37344*height), control1: CGPoint(x: 1.03611*width, y: 0.16834*height), control2: CGPoint(x: 0.95025*width, y: 0.27868*height))
        path.addCurve(to: CGPoint(x: 0.90913*width, y: 0.56222*height), control1: CGPoint(x: 0.92638*width, y: 0.43708*height), control2: CGPoint(x: 0.9089*width, y: 0.49778*height))
        path.addCurve(to: CGPoint(x: 0.9375*width, y: 0.81346*height), control1: CGPoint(x: 0.90942*width, y: 0.64763*height), control2: CGPoint(x: 0.9634*width, y: 0.73254*height))
        path.addCurve(to: CGPoint(x: 0.77032*width, y: 0.99595*height), control1: CGPoint(x: 0.91151*width, y: 0.89466*height), control2: CGPoint(x: 0.84914*width, y: 0.9755*height))
        path.addCurve(to: CGPoint(x: 0.53101*width, y: 0.91894*height), control1: CGPoint(x: 0.68831*width, y: 1.01723*height), control2: CGPoint(x: 0.61417*width, y: 0.93445*height))
        path.addCurve(to: CGPoint(x: 0.32921*width, y: 0.91365*height), control1: CGPoint(x: 0.4639*width, y: 0.90642*height), control2: CGPoint(x: 0.39167*width, y: 0.94243*height))
        path.addCurve(to: CGPoint(x: 0.18731*width, y: 0.76056*height), control1: CGPoint(x: 0.26645*width, y: 0.88473*height), control2: CGPoint(x: 0.23784*width, y: 0.80936*height))
        path.addCurve(to: CGPoint(x: 0.00282*width, y: 0.5984*height), control1: CGPoint(x: 0.12752*width, y: 0.70281*height), control2: CGPoint(x: 0.01682*width, y: 0.68269*height))
        path.addCurve(to: CGPoint(x: 0.12287*width, y: 0.37267*height), control1: CGPoint(x: -0.01148*width, y: 0.51232*height), control2: CGPoint(x: 0.07499*width, y: 0.44395*height))
        path.addCurve(to: CGPoint(x: 0.24833*width, y: 0.23296*height), control1: CGPoint(x: 0.15848*width, y: 0.31966*height), control2: CGPoint(x: 0.21725*width, y: 0.28907*height))
        path.addCurve(to: CGPoint(x: 0.32212*width, y: 0.01293*height), control1: CGPoint(x: 0.286*width, y: 0.16495*height), control2: CGPoint(x: 0.25843*width, y: 0.05395*height))
        path.addCurve(to: CGPoint(x: 0.53101*width, y: 0.05089*height), control1: CGPoint(x: 0.38321*width, y: -0.02642*height), control2: CGPoint(x: 0.46022*width, y: 0.03986*height))
        path.closeSubpath()
        return path
    }
}
