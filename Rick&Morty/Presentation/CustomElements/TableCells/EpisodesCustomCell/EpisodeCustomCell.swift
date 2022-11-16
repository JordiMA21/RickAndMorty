//
//  EpisodeCustomCell.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 14/11/22.
//

import UIKit

class EpisodeCustomCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var labelEpisodeName: UILabel!
    @IBOutlet weak var labelAirDate: UILabel!
    @IBOutlet weak var labelEpisodeNum: UILabel!
    @IBOutlet weak var viewEpisodeNum: UIView!
    @IBOutlet weak var hStack: UIStackView!
    
    //MARK: Properties
    
    //MARK: Functions
    func display(summary: EpisodeCustomCellSummary) {
        labelEpisodeName.text = summary.episodeName
        labelAirDate.text = summary.episodeAirDate
        labelEpisodeNum.text = summary.episodeNum
        
        viewEpisodeNum.layer.cornerRadius = 40
        viewEpisodeNum.layer.borderWidth = 1
        viewEpisodeNum.layer.borderColor = UIColor.systemBlue.cgColor
        
        hStack.layer.cornerRadius = 16
    }
}
