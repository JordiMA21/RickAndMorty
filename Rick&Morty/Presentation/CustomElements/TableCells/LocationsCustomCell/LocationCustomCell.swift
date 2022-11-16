//
//  LocationCustomCell.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 14/11/22.
//

import UIKit

class LocationCustomCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var typeName: UILabel!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var dimesionName: UILabel!
    @IBOutlet weak var vStack: UIStackView!
    
    //MARK: Properties
    
    //MARK: Functions
    func display(summary: LocationCustomCellSummary) {
        typeName.text = summary.typeName
        locationName.text = summary.locationName
        dimesionName.text = summary.dimesionName
        
        if summary.dimesionName == "" {
            dimesionName.text = "unknown"
        }
              
        vStack.layer.cornerRadius = 16
    }
}
