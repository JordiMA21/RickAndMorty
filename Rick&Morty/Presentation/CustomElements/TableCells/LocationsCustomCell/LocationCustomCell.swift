//
//  LocationCustomCell.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 14/11/22.
//

import UIKit

class LocationCustomCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var labelTypeName: UILabel!
    @IBOutlet weak var labelLocationName: UILabel!
    @IBOutlet weak var labelDimesionName: UILabel!
    @IBOutlet weak var vStack: UIStackView!
    
    //MARK: Properties
    
    //MARK: Functions
    func display(summary: LocationCustomCellSummary) {
        labelTypeName.text = summary.typeName
        labelLocationName.text = summary.locationName
        labelDimesionName.text = summary.dimesionName
        
        if summary.dimesionName == "" {
            labelDimesionName.text = "unknown"
        }
              
        vStack.layer.cornerRadius = 16
    }
}
