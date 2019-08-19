//
//  SecondViewController.swift
//  WeatherMap
//
//  Created by ASamir on 6/18/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{
    //Outlets
    @IBOutlet weak var locationList : UITableView!
    var textString : String = ""
    var appendedCitiesTitles : [String] = []
    //variables
    var cityWeatherObject : CitiesWeatherResponseModel =  CitiesWeatherResponseModel()
    var cityWeatherObjectArray : [CitiesWeatherInfoModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //set  tableView dataSource and delegate
        locationList.delegate   =   self
        locationList.dataSource =   self
        // register cell xib
        locationList.register(UINib(nibName: "LocationTableViewCell", bundle: nil), forCellReuseIdentifier: "LocationTableViewCell")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.locationList.reloadData()
    }
}

extension SecondViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityWeatherObjectArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell", for: indexPath) as! LocationTableViewCell
        cell.locationLabel.text = cityWeatherObjectArray[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // add segue identifier
        self.performSegue(withIdentifier: "cellData", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //perform segue with navigation controller
        if let nav = segue.destination as? UINavigationController,
            let vc = nav.topViewController as? DetailsViewController{
            vc.CityObject = cityWeatherObjectArray[(locationList.indexPathForSelectedRow?.row)!]
            locationList.deselectRow(at: locationList.indexPathForSelectedRow!, animated: true)
            
        }
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
   
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            self.cityWeatherObjectArray.remove(at: indexPath.row)
            
            self.locationList.reloadData()
        }
        
    }
}
