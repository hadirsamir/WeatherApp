//
//  CitiesWeatherResponseModel.swift
//  WeatherMap
//
//  Created by ASamir on 6/18/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import ObjectMapper

class CitiesWeatherResponseModel : Mappable {
    var message : String = ""
    var cod : String = ""
    var count : Int = 0
    var list :[CitiesWeatherInfoModel] = []
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        cod     <- map["cod"]
        count   <- map["count"]
        list    <- map["list"]
    }
}
