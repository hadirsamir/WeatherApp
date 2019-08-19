//
//  CitiesWeatherInfoModel.swift
//  WeatherMap
//
//  Created by ASamir on 6/18/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import ObjectMapper

class CitiesWeatherInfoModel: Mappable {
    var id      : Int = 0
    var name    : String = ""
    var coord   : CityCoordinatesModel = CityCoordinatesModel()
    var main    : MainWeatherInfoModel  =  MainWeatherInfoModel()
    var dt      : Int = 0
    var wind    : WindInfoModel = WindInfoModel()
    var weather : [WeatherDescriptionModel] = []
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id           <-   map["id"]
        name         <-   map["name"]
        main         <-   map["main"]
        coord        <-   map["coord"]
        dt           <-   map["dt"]
        wind         <-   map["wind"]
        weather      <-   map["weather"]
    }
}


