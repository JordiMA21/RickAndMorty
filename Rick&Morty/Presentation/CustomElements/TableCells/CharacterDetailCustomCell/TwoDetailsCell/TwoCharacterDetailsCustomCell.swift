//
//  TwoCharacterDetailsCustomCell.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 14/11/22.
//

import UIKit

class TwoCharacterDetailsCustomCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var labelTitleLeft: UILabel!
    @IBOutlet weak var labelTextLeft: UILabel!
    @IBOutlet weak var vStackLeft: UIStackView!
    @IBOutlet weak var labelTitleRight: UILabel!
    @IBOutlet weak var labelTextRight: UILabel!
    @IBOutlet weak var vStackRight: UIStackView!
    
    //MARK: Properties
    
    //MARK: Functions
    func display(summary: TwoCharacterDetailsCustomCellSummary) {
        labelTitleLeft.text = summary.titleLeft
        labelTextLeft.text = summary.labelLeft
        labelTitleRight.text = summary.titleRight
        labelTextRight.text = summary.labelRight
        
        vStackLeft.layer.cornerRadius = 16
        vStackRight.layer.cornerRadius = 16
    }
    
    override func prepareForReuse() {
        labelTitleLeft.text = ""
        labelTextLeft.text = ""
        labelTitleRight.text = ""
        labelTextRight.text = ""
    }
}
