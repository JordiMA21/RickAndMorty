//
//  OneCharacterDetailCustomCell.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 14/11/22.
//

import UIKit

class OneCharacterDetailCustomCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var vStack: UIStackView!
    @IBOutlet weak var viewImageContainer: UIView!
    @IBOutlet weak var imageGender: UIImageView!
    
    //MARK: Properties
    
    //MARK: Functions
    func display(summary: OneCharacterDetailCustomCellSummary) {
        labelTitle.text = summary.title
        labelText.text = summary.label
        
        switch summary.label {
            case "Male":
                imageGender.image = UIImage(named: "male")
            case "Female":
                imageGender.image = UIImage(named: "female")
            default:
                imageGender.image = UIImage(named: "unknown")
        }
        
        if summary.title?.lowercased().contains("gender") == false {
            viewImageContainer.isHidden = true
            labelText.textAlignment = .center
        }
        vStack.layer.cornerRadius = 16
    }
    
    override func prepareForReuse() {
        
    }
}
