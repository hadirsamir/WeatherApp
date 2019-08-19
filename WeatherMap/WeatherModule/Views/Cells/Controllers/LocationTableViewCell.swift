//
//  LocationTableViewCell.swift
//  WeatherMap
//
//  Created by ASamir on 6/18/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import UIKit

class LocationTableViewCell : UITableViewCell {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationView : UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        locationView.layer.cornerRadius  =  5
        locationView.layer.masksToBounds = true
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
