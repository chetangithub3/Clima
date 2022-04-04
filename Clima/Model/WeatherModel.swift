//
//  WeatherModel.swift
//  Clima
//
//  Created by Chetan Dhowlaghar on 3/16/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

struct WeatherModel{
    let cityName: String
    let conditonID: Int
    let temperature: Float
    
    var temperatureString: String{
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String{
        switch conditonID{
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 700...781:
                return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
    }
        
}
}
