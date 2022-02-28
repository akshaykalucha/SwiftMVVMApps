//
//  WeatherModel.swift
//  SwiftUI-MVVM
//
//  Created by Akshay Kalucha on 28/02/22.
//

import Foundation

struct response: Codable {
    var timezone: String
    var currently: Currently
    var daily: Daily
}

struct Currently: Codable {
    var temprature: Double
    var time: TimeInterval
}

struct Daily: Codable {
    var summary: String
    var icon: String
}
