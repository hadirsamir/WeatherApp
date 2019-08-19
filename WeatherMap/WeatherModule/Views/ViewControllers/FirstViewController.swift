//
//  FirstViewController.swift
//  WeatherMap
//
//  Created by ASamir on 6/18/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import UIKit
import MapKit
import RxSwift
class FirstViewController: UIViewController, MKMapViewDelegate {
    // outlets
    @IBOutlet weak var mapKitView: MKMapView!
    //variables
    var annotationTitle = ""
    internal let disposeBag = DisposeBag()
    internal let weatherViewModel = WeatherViewModel()
    internal var weatherObject : CitiesWeatherResponseModel = CitiesWeatherResponseModel()
    internal var citiesWeatherArray :[CitiesWeatherInfoModel] = [CitiesWeatherInfoModel]()
    var emptyArray :[CitiesWeatherInfoModel] = []
    var citiesTitleArray :[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapKitView.delegate = self
        initListeners()
        callData()
    }
    
    // listen to to subject event (observer)
    fileprivate func initListeners(){
        self.weatherViewModel.objWeatherRemoteObservable.asObservable().subscribe(onNext: { (weatherResponse) in
            self.weatherObject = weatherResponse
            self.citiesWeatherArray.append(contentsOf: weatherResponse.list)
            self.createAnnotation()
        }, onError: { (error) in
        }, onCompleted: {
        }).disposed(by: self.disposeBag)
    }
    
    fileprivate func callData(){
        self.weatherViewModel.getWeatherData()
    }
    // function create Annotations
    func createAnnotation(){
        for locationPin in citiesWeatherArray{
            let annotations = MKPointAnnotation()
            
            annotations.title = locationPin.name
            self.annotationTitle = locationPin.name
            annotations.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(locationPin.coord.lat), longitude: CLLocationDegrees(locationPin.coord.lon))
            
            // add annotation to the map
            mapKitView.addAnnotation(annotations)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation {
            let vc = self.tabBarController!.viewControllers![1] as! SecondViewController
            self.citiesTitleArray.append(annotation.title as! String)
            vc.textString = annotation.title as! String
            vc.appendedCitiesTitles = self.citiesTitleArray
            for cityTitle in citiesTitleArray{
                for cityWeather in citiesWeatherArray{
                    if cityTitle == cityWeather.name{
                        self.emptyArray.append(cityWeather)
                        
                        vc.cityWeatherObjectArray = self.emptyArray
                    }
                }
                
            }
        }
    }
}

