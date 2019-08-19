//
//  CityCoordinatesModel.swift
//  WeatherMap
//
//  Created by ASamir on 6/18/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import ObjectMapper

class CityCoordinatesModel: Mappable {
    var lat :  Double = 0.0
    var lon :  Double = 0.0
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        lat <- map["lat"]
        lon <- map["lon"]
    }
}
