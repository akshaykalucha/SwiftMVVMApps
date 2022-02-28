//
//  WeatherModel.swift
//  SwiftUI-MVVM
//
//  Created by Akshay Kalucha on 28/02/22.
//

import Foundation


class WeatherDetail {
    private struct response: Codable {
        var timezone: String
        var currently: Currently
        var daily: Daily
    }

    private struct Currently: Codable {
        var temprature: Double
        var time: TimeInterval
    }

    private struct Daily: Codable {
        var summary: String
        var icon: String
        var data: [DailyData]
    }
    
    private struct DailyData: Codable {
        var icon: String
        var time: TimeInterval
        var summary: String
        var tempratureHigh: Double
        var tempratureLow: Double
    }
    
    var timezone = ""
    var currentTime = 0.0
    var temprature = 0
    var summary = ""
    var dailyIcon = ""

}
