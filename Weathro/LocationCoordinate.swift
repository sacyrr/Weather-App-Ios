//
//  LocationCoordinate.swift
//  Weathro
//
//  Created by Sachin on 08/05/18.
//  Copyright © 2018 Sachin. All rights reserved.
//

import Foundation
struct  LocationCoordinate {
    var latitude : Double
    var longitude : Double
}
extension LocationCoordinate : CustomStringConvertible{
    var description: String {
        return "\(latitude),\(longitude)"
    }
    
}
