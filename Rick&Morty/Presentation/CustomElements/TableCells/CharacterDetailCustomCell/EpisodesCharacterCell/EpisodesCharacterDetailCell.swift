//
//  EpisodesCharacterDetailCell.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 21/11/22.
//

import UIKit

class EpisodesCharacterDetailCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var labelEpisodeName: UILabel!
    @IBOutlet weak var labelAirDate: UILabel!
    @IBOutlet weak var labelEpisodeNum: UILabel!
    @IBOutlet weak var viewEpisodeNum: UIView!
    @IBOutlet weak var hStack: UIStackView!
    
    //MARK: Properties
    var url: String?
    
    //MARK: Functions
    func loadEpisode(url: String?) {
        self.url = url
        Task {
            if let episode = try? await APICalls.shared.getDetailEpisode(path: url) {
                DispatchQueue.main.async {
                    if url == self.url {
                        self.labelEpisodeName.text = episode.name
                        self.labelAirDate.text = episode.airDate
                        self.labelEpisodeNum.text = episode.episode
                        
                        self.viewEpisodeNum.layer.cornerRadius = 40
                        self.viewEpisodeNum.layer.borderWidth = 1
                        self.viewEpisodeNum.layer.borderColor = UIColor.systemBlue.cgColor
                        
                        self.hStack.layer.cornerRadius = 16
                    }
                }
            } else {
                self.labelEpisodeName.text = "There is an error"
                self.labelEpisodeName.tintColor = .red
            }
        }
    }
    
    override func prepareForReuse() {
        self.labelEpisodeName.text = ""
        self.labelEpisodeName.tintColor = .systemGreen
        self.labelAirDate.text = ""
        self.labelEpisodeNum.text = ""
        self.url = nil
    }
}
