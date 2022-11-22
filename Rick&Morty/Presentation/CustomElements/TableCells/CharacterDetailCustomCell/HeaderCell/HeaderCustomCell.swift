//
//  HeaderCustomCell.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 18/11/22.
//

import UIKit

class HeaderCustomCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var labelCharacterName: UILabel!
    @IBOutlet weak var labelEpisodesNum: UILabel!
    @IBOutlet weak var imageArrowSymbol: UIImageView!
    
    //MARK: Properties
    
    //MARK: Functions
    func display(summary: HeaderCustomCellSummary) {
        labelCharacterName.text = summary.characterName
        labelEpisodesNum.text = "\(summary.episodesNum)"
        
        if summary.isOpened == true {
            imageArrowSymbol.image = UIImage(systemName: "arrowtriangle.down.fill")
        } else {
            imageArrowSymbol.image = UIImage(systemName: "arrowtriangle.right.fill")
        }
    }
    
    override func prepareForReuse() {
        labelCharacterName.text = ""
        labelEpisodesNum.text = ""
    }
}
