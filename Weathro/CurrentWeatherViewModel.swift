//
//  CurrentWeatherViewModel.swift
//  Weathro
//
//  Created by Sachin on 07/05/18.
//  Copyright © 2018 Sachin. All rights reserved.
//

import Foundation
import UIKit
struct CurrentWatherViewModel {
    let temp : String
    let humidity : String
    let pressure : String
    let visibility : String
    let ozone : String
    let windspeed : String
    let summary : String
    let precisionProbability : String
//    let precisionType : String
    let icon : UIImage
    
    init(model:CurrentWeather)
    {
        let updatedTemp = Int(model.temp)
        self.temp = "\(updatedTemp)°F"
        
        let updatedHumidity = Int(model.humidity * 100)
        self.humidity = "\(updatedHumidity)%"
        
        let updatedPressure = Int(model.pressure)
        self.pressure = "\(updatedPressure)"
        
        let updatedVisibility = Int(model.visibility)
        self.visibility = "\(updatedVisibility)"
        
        let updatedOzone = Int(model.ozone)
        self.ozone = "\(updatedOzone)"
        
        let updatedWindSpeed = Int(model.windSpeed)
        self.windspeed = "\(updatedWindSpeed)"
        
        self.summary = model.summary
        
//        self.precisionType = model.precisionType
        
        let updatedPrecisionProbability = Int(model.precisonProbability * 100)
        self.precisionProbability = "\(updatedPrecisionProbability)%"
        
       let weatherIcon = WeatherIcon(iconValue: model.icon)
        self.icon = weatherIcon.image
    }
}
