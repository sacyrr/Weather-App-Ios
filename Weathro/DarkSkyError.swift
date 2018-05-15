//
//  DarkSkyError.swift
//  Weathro
//
//  Created by Sachin on 08/05/18.
//  Copyright © 2018 Sachin. All rights reserved.
//

import Foundation
enum DarkSkyError : Error
{
    case requestFailed
    case responseUnsuccesful
    case invalidData
    case jsonConversionFailed
    case invalidUrl
    case jsonParsingFailure
}
