//
//  WeatherViewModel.swift
//  WeatherMap
//
//  Created by ASamir on 6/18/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class WeatherViewModel: NSObject {
    public var errorModule = PublishSubject<ErrorModule>()
    public private(set) var objWeatherRemoteObservable = PublishSubject<CitiesWeatherResponseModel>()
    private var disposeBag = DisposeBag()
    private var WeatherRepo = WeatherRepository<CitiesWeatherResponseModel>()
    
    override init() {
        super.init()
        self.initializeSubscribers()
    }
    private func initializeSubscribers(){
        //GET LIST
        self.WeatherRepo.objObservableRemoteData.asObservable().subscribe(onNext: { (weatherResponse) in
            self.objWeatherRemoteObservable.onNext(weatherResponse)
        }, onError: { (error) in
        }, onCompleted: {
        }).disposed(by: self.disposeBag)
        
        self.WeatherRepo.errorModule.asObservable().subscribe(onNext: { (err) in
            self.errorModule.onNext(err)
        }).disposed(by: disposeBag)
    }
    func getWeatherData(){
        self.WeatherRepo.subscribeToAPI(url: WeatherConstants.BASE_URL,method:.get)
    }
}
