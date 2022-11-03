//
//  CharacterViewController.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 3/11/22.
//

import UIKit

class CharacterViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var labelNameDetail: UILabel!
    @IBOutlet weak var labelStatusDetail: UILabel!
    @IBOutlet weak var labelSpeciesDetail: UILabel!
    @IBOutlet weak var labelGenderDetail: UILabel!
    @IBOutlet weak var labelLocationDetail: UILabel!
    
    
    //MARK: Properties
    var viewModel: CharacterViewModel?
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: Functions
    private func setupBinding() {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        title = viewModel?.chosenCharacter.name
        imageDetail.layer.cornerRadius = 104
        if let url = URL(string: viewModel?.chosenCharacter.image ?? "") {
            imageDetail.load(url: url)
        }
        labelNameDetail.text = viewModel?.chosenCharacter.name
        labelStatusDetail.text = viewModel?.chosenCharacter.status
        labelSpeciesDetail.text = viewModel?.chosenCharacter.species
        labelGenderDetail.text = viewModel?.chosenCharacter.gender
        labelLocationDetail.text = viewModel?.chosenCharacter.location.name
    }
}

