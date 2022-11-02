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
    
    //MARK: Properties
    
    
    //MARK: Functions
    func display(summary: HomeCustomCellSummary) {
        if let url = URL(string: summary.image ?? "") {
            imageCharacter.load(url: url)
        }
        labelCharacterName.text = summary.characterName
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
