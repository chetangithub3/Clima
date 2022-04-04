//
//  WeatherData.swift
//  Clima
//
//  Created by Chetan Dhowlaghar on 3/15/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable{
    var name: String
    var main: Main
    var weather: [Weather]
}

struct Main: Decodable{
    var temp: Float
}

struct Weather: Decodable{
    var description: String
    var id: Int
}
