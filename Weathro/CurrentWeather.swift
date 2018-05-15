//
//  File.swift
//  Weathro
//
//  Created by Sachin on 07/05/18.
//  Copyright © 2018 Sachin. All rights reserved.
//

import Foundation
struct  CurrentWeather {
    var temp : Double
    var humidity : Double
    var pressure : Double
    var visibility : Double
    var ozone : Double
    var windSpeed : Double
    var summary : String
    var icon : String
//    var precisionType : String
    var precisonProbability : Double
}

extension CurrentWeather
{
    struct Key {
        static let temp = "temperature"
        static let humidity = "humidity"
        static let pressure = "pressure"
        static let visibility = "visibility"
        static let ozone = "ozone"
        static let windSpeed = "windSpeed"
        static let summary = "summary"
        static let icon = "icon"
//        static let precisionType = "precipType"
        static let precisionProbability = "precipProbability"
    }
    init?(json: [String:AnyObject])
    {
        guard let tempVal = json[Key.temp] as? Double,
        let humidityVal = json[Key.humidity]as? Double,
        let pressureVal = json[Key.pressure]as? Double,
        let visibilityVal = json[Key.visibility]as? Double,
        let ozoneVal = json[Key.ozone]as? Double,
        let windSpeedVal = json[Key.ozone]as? Double,
        let summaryVal = json[Key.summary]as? String,
        let iconVal = json[Key.icon]as? String,
//        let precisionTypeVal = json[Key.precisionType]as? String,
        let precisionProbabilityVal = json[Key.precisionProbability]as? Double
        else {
            return(nil)
        }
        self.temp = tempVal
        self.humidity = humidityVal
        self.pressure = pressureVal
        self.visibility = visibilityVal
        self.ozone = ozoneVal
        self.windSpeed = windSpeedVal
        self.summary = summaryVal
        self.icon = iconVal
//        self.precisionType = precisionTypeVal
        self.precisonProbability = precisionProbabilityVal
        
    }
}
