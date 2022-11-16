//
//  CharacterCustomCell.swift
//  RickAndMortyApp
//
//  Created by Jorge Miguel on 2/11/22.
//

import UIKit

class CharacterCustomCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var labelCharacterName: UILabel!
    @IBOutlet weak var imageGender: UIImageView!
    @IBOutlet weak var labelCharacterStatus: UILabel!
    @IBOutlet weak var imageCharacterStatus: UIImageView!
    @IBOutlet weak var labelCharacterID: UILabel!
    @IBOutlet weak var hStack: UIStackView!
    
    var id: Int?
    
    //MARK: Properties
    
    //MARK: Functions
    func display(summary: CharacterCustomCellSummary) {
        if let url = URL(string: summary.image ?? "") {
            loadImage(url: url, id: summary.characterID)
            imageCharacter.layer.cornerRadius = 68
            imageCharacter.layer.borderWidth = 1
            imageCharacter.layer.borderColor = UIColor.systemBlue.cgColor
            hStack.layer.cornerRadius = 16
        }
        
        switch summary.characterGender {
            case "Male":
                imageGender.image = UIImage(named: "male")
            case "Female":
                imageGender.image = UIImage(named: "female")
            default:
                imageGender.image = UIImage(named: "unknown")
        }
        
        switch summary.characterStatus {
            case "Alive":
                imageCharacterStatus.tintColor = .green
            case "Dead":
                imageCharacterStatus.tintColor = .red
            default:
                imageCharacterStatus.tintColor = .gray
        }
        
        labelCharacterName.text = summary.characterName
        labelCharacterName.font = labelCharacterName.font.withSize(22)
        labelCharacterStatus.text = summary.characterStatus
        labelCharacterID.text = "#\(summary.characterID)"
        id = summary.characterID
        
    }
    
    override func prepareForReuse() {
        imageCharacter.image = nil
        labelCharacterName.text = ""
        labelCharacterStatus.text = ""
    }
    
    private func loadImage(url: URL, id: Int) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        guard let self = self else { return }
                        if id == self.id {
                            self.imageCharacter.image = image
                        }
                    }
                }
            }
        }
    }
}
