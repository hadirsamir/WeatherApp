//
//  MainWeatherInfoModel.swift
//  WeatherMap
//
//  Created by ASamir on 6/18/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import ObjectMapper

class MainWeatherInfoModel: Mappable {
    var temp        :     Double = 0.0
    var pressure    :     Int = 0
    var humidity    :     Int = 0
    var temp_min    :     Double = 0
    var temp_max    :    Double  = 0
    
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        temp      <- map["temp"]
        pressure  <- map["pressure"]
        humidity  <- map["humidity"]
        temp_min  <- map["temp_min"]
        temp_max  <- map["temp_max"]
    }
}

