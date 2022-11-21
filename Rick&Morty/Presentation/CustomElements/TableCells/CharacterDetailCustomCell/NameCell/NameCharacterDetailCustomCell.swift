//
//  NameCharacterDetailCustomCell.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 14/11/22.
//

import UIKit

class NameCharacterDetailCustomCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var labelCharacterName: UILabel!
    
    //MARK: Properties
    
    //MARK: Functions
    func display(summary: NameCharacterDetailCustomCellSummary) {
        labelCharacterName.text = summary.characterName
        viewName.layer.borderWidth = 0.5
        viewName.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    override func prepareForReuse() {
        labelCharacterName.text = ""
    }
}
