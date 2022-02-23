//
//  Model.swift
//  SwiftUI-MVVM
//
//  Created by Akshay Kalucha on 23/02/22.
//

import SwiftUI

//Codable is protocol to convert JSON data to struct

struct weatherModel: Codable {
    let timezone: String
    let current: CurrentWeather
}


struct CurrentWeather: Codable {
    let temp: Float
    let weather: [WeatherInfo]
}


struct WeatherInfo: Codable {
    let main: String
    let description: String
}
