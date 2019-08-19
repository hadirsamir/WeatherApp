//
//  ErrorModule.swift
//  WeatherMap
//
//  Created by ASamir on 6/18/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import Foundation
import ObjectMapper

struct ErrorModule : Error{
    let desc:String
    let code:Int
}
