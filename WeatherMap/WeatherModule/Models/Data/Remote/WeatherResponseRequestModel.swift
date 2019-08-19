//
//  WeatherResponseModel.swift
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

class WeatherRequestClass<U:Mappable>: WeatherRemoteDataSourceContract {
    
    typealias T = U
    
    func performWeatherRequest(url: String, method: HTTPMethod) -> Observable<U>? {
        return  Observable.create{
            observer in
            Alamofire.request(url,
                              method: method,
                             encoding: URLEncoding.default)
                .responseJSON { response in
                    switch response.result {
                    case .success(let json):
                        guard let value = json as? [String: Any]
                            else {
                                return
                        }
                        let responseObj = U(JSON: value)
                        observer.onNext(responseObj!)
                    case .failure(let error):
                        observer.onError(error)
                    }
            }
            return Disposables.create {
            }
        }
    }
}

