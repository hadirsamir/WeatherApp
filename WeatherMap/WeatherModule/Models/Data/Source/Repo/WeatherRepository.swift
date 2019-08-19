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

class WeatherRepository<REMOTE:Mappable>:weatherDataSourceContract {
    typealias T = REMOTE
    // obj of request Class
    private let objRequestClass: WeatherRequestClass = WeatherRequestClass<REMOTE>()
    //publish a subject to observe
    private var objObservableRemote = PublishSubject<REMOTE>()
    //publish subject for error
    public var errorModule = PublishSubject<ErrorModule>()
    //terminate observer
    private var bag = DisposeBag()
    // closure to return subject
    public var objObservableRemoteData:PublishSubject<REMOTE>{
        return objObservableRemote
    }
    func subscribeToAPI(url: String, method: HTTPMethod)
    {
        self.performWeatherRequest(url: url, method: method)?.subscribe({ (subObj) in
            
            switch subObj
            {
            case .next(let responseObj):
                self.objObservableRemote.onNext(responseObj)
            case .error(_):
                self.errorModule.onNext(ErrorModule(desc: "network first time fail", code: 404))
            case .completed:
                print("Completed")
            }
        }).disposed(by: bag)
    }
    
    //confirm protocole functions
    func performWeatherRequest(url:String, method: HTTPMethod)-> Observable<T>?{
        if let objObserve = self.objRequestClass.performWeatherRequest(url: url, method: method)
        {
            return objObserve
        }
        return Observable.empty()
        
    }
    
    
}
