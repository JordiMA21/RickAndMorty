//
//  CharacterDetailViewController.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 3/11/22.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var characterDetailTableView: UITableView!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var heightHeader: NSLayoutConstraint!
    @IBOutlet weak var headerTableView: UIView!
    @IBOutlet weak var goToTopButton: UIButton!
    
    //MARK: Properties
    var viewModel: CharacterDetailViewModel! {
        didSet {
            if isViewLoaded {
                setupViewModel()
            }
        }
    }
    let indexPath = IndexPath(row: 0, section: 0)
    var isOpened: Bool = false
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureTableView(characterDetailTableView.self)
        setupViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: Functions
    private func setupUI() {
        if let url = URL(string: viewModel?.chosenCharacter.image ?? "") {
            headerImageView.load(url: url)
        }
        title = ""
        goToTopButton.layer.cornerRadius = 16
    }
    
    private func setupViewModel() {
        guard let viewModel = viewModel else { return }
    }
    
    // MARK: - IBActions
    @IBAction func goToTopAction(_ sender: Any) {
        self.characterDetailTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}

