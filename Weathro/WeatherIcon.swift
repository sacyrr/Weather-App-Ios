//
//  WeatherIcon.swift
//  Weathro
//
//  Created by Sachin on 07/05/18.
//  Copyright © 2018 Sachin. All rights reserved.
//

import Foundation
import UIKit
enum WeatherIcon : String {
    case clearDay
    case clearNight
    case rain
    case snow
    case sleet
    case wind
    case fog
    case cloudy
    case partlyCloudyDay
    case partlyCloudyNight
    case `default`
    
    init(iconValue:String)
    {
        switch iconValue {
        case "clear-day" : self = .clearDay
        case "clear-night" : self = .clearNight
        case "rain" : self = .rain
        case "snow" : self = .snow
        case "sleet" : self = .sleet
        case "wind" : self = .wind
        case "fog" : self = .fog
        case "cloudy" : self = .cloudy
        case "partly-cloudy-day" : self = .partlyCloudyDay
        case "partly-cloudy-night" : self = .partlyCloudyNight
        default: self = .default
        }
    }
}
extension WeatherIcon{
    var image : UIImage{
        switch  self {
       
        case .clearDay:
            return #imageLiteral(resourceName: "clear-day.png")
        case .clearNight:
            return #imageLiteral(resourceName: "clear-night.png")
        case .rain:
            return #imageLiteral(resourceName: "rain.png")
        case .snow:
            return #imageLiteral(resourceName: "snow.png")
        case .sleet:
            return #imageLiteral(resourceName: "sleet.png")
        case .wind:
            return #imageLiteral(resourceName: "wind.png")
        case .fog:
            return #imageLiteral(resourceName: "fog.png")
        case .cloudy:
            return #imageLiteral(resourceName: "cloudy.png")
        case .partlyCloudyDay:
            return #imageLiteral(resourceName: "partly-cloudy-day.png")
        case .partlyCloudyNight:
            return #imageLiteral(resourceName: "partly-cloudy-night.png")
        case .default:
            return #imageLiteral(resourceName: "default.png")
        }
    }
}
