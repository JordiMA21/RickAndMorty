//
//  HomeCustomCell.swift
//  RickAndMortyApp
//
//  Created by Jorge Miguel on 2/11/22.
//

import UIKit

class HomeCustomCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var labelCharacterName: UILabel!
    @IBOutlet weak var imageGender: UIImageView!
    //    @IBOutlet weak var labelCharacterStatus: UILabel!
    @IBOutlet weak var labelCharacterStatus: UILabel!
    @IBOutlet weak var hStack: UIStackView!
    
    //MARK: Properties
    
    //MARK: Functions
    func display(summary: HomeCustomCellSummary) {
        if let url = URL(string: summary.image ?? "") {
            imageCharacter.load(url: url)
            imageCharacter.layer.cornerRadius = 68
            imageCharacter.layer.borderWidth = 1
            imageCharacter.layer.borderColor = UIColor.systemBlue.cgColor
            hStack.layer.cornerRadius = 16
        }
        if summary.characterGender == "Male" {
            imageGender.image = UIImage(named: "male")
        } else if summary.characterGender == "Female" {
            imageGender.image = UIImage(named: "female")
        } else if summary.characterGender == "unknown" {
            imageGender.image = UIImage(named: "unknown")
        }
        
        labelCharacterName.text = summary.characterName
        labelCharacterName.font = labelCharacterName.font.withSize(22)
        labelCharacterStatus.text = summary.characterStatus
    }
    
    override func prepareForReuse() {
        imageCharacter.image = nil
        labelCharacterName.text = ""
//        labelCharacterStatus.text = ""
        labelCharacterStatus.text = ""
    }
}
