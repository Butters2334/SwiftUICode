//
//  ColorDemo.swift
//  SwiftUICode
//
//  Created by ac on 2020/12/16.
//  Copyright © 2020 ancc. All rights reserved.
//

import SwiftUI


extension Color {
    static var randomColor: Color {
        let red = Double.random(in: 0.0..<1.0)
        let green = Double.random(in: 0.0..<1.0)
        let blue = Double.random(in: 0.0..<1.0)
        return Color(red: red,green: green,blue: blue)
    }
}
