//
//  WeatherRepository.swift
//  WeatherMap
//
//  Created by ASamir on 6/18/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ObjectMapper
import Alamofire

typealias weatherDataSourceContract = WeatherRemoteDataSourceContract
// weather Remote Protocole
protocol WeatherRemoteDataSourceContract {
    associatedtype T : Mappable
    func performWeatherRequest(url:String, method: HTTPMethod)-> Observable<T>?
    
}
