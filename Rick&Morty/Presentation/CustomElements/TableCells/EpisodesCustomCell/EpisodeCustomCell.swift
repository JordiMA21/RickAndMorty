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
    @IBOutlet weak var labelEpisodeNum: UILabel!
    @IBOutlet weak var labelEpisodeID: UILabel!
    @IBOutlet weak var viewEpisodeID: UIView!
    @IBOutlet weak var hStack: UIStackView!
    
    //MARK: Properties
    
    //MARK: Functions
    func display(summary: EpisodeCustomCellSummary) {
        labelEpisodeName.text = summary.episodeName
        labelEpisodeNum.text = summary.episodeNum
        labelEpisodeID.text = "\(summary.episodeID)"
        
        viewEpisodeID.layer.cornerRadius = 28
        viewEpisodeID.layer.borderWidth = 1
        viewEpisodeID.layer.borderColor = UIColor.systemBlue.cgColor
        
        hStack.layer.cornerRadius = 16
    }
}
