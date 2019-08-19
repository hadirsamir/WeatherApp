//
//  WeatherInfoModel.swift
//  WeatherMap
//
//  Created by ASamir on 6/18/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherDescriptionModel : Mappable {
    var id          : Int = 0
    var main        : String = ""
    var description : String = ""
    var icon        : String = ""
    
    
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id          <-   map["id"]
        main        <-   map["main"]
        description <-  map["description"]
        icon        <-  map["icon"]
    }
}

