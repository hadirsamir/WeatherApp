//
//  WindInfoModel.swift
//  WeatherMap
//
//  Created by ASamir on 6/18/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import ObjectMapper

class WindInfoModel: Mappable {
    var speed  :     Double = 0.0
    var deg    :     Int = 0
    
    
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
       speed      <- map["speed"]
       deg        <- map["deg"]
       
    }
}


