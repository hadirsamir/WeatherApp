//
//  DetailsViewController.swift
//  WeatherMap
//
//  Created by ASamir on 6/18/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    //Outlets
    @IBOutlet weak var tempValueLabel : UILabel!
    @IBOutlet weak var windDegreeValueLabel : UILabel!
    @IBOutlet weak var windSpeedValueLabel : UILabel!
    @IBOutlet weak var humidityValueLabel : UILabel!
    @IBOutlet weak var rainValueLabel : UILabel!
    @IBOutlet weak var mainWeatherInfoView : UIView!
    var text : String = ""
    var CityObject : CitiesWeatherInfoModel = CitiesWeatherInfoModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // set Corner Raduis to aview
       // mainWeatherInfoView.layer.cornerRadius = 3
        //mainWeatherInfoView.layer.masksToBounds = true
        //call functions
        addBackBtn()
        setInfo()
    }
    //set Labels Info
    func setInfo(){
        tempValueLabel.text       = String(CityObject.main.temp)
        windDegreeValueLabel.text = String(CityObject.wind.deg)
        windSpeedValueLabel.text  = String(CityObject.wind.speed)
        humidityValueLabel.text   = String(CityObject.main.humidity)
        rainValueLabel.text       = "unDefined"
    }
    //set back btn in nav Bar
    func addBackBtn(){
        let backbutton = UIButton(type: .custom)
        backbutton.setTitle("Back", for: .normal)
        backbutton.setTitleColor(UIColor.black, for: .normal)
        backbutton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.blue
    }
    // back btn to dismiss view
   @objc func backButtonPressed(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
