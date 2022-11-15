//
//  CharactersViewController.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import UIKit

class CharactersViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var charactersTableView: UITableView!
    @IBOutlet weak var goToTopButton: UIButton!
    
    //MARK: Properties
    var viewModel: CharactersViewModel! {
        didSet {
            if isViewLoaded {
                setupViewModel()
            }
        }
    }
    let searchController = UISearchController(searchResultsController: nil)
    let indexPath = IndexPath(row: 0, section: 0)
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        configureSearchBar()
        configureTableView(charactersTableView.self)
        setupViewModel()
    }
    
    // MARK: - Functions
    private func setupBindings() { //SetupUI -> cambiarlo
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        goToTopButton.layer.cornerRadius = 16
    }
    
    private func setupViewModel() {
        guard let viewModel = viewModel else { return }
        viewModel.getCharactersList(searchTextInput: viewModel.searchText) {
            self.charactersTableView.reloadData()
        }
    }
    
    // MARK: - IBActions
    @IBAction func goToTopAction(_ sender: Any) {
        self.charactersTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}
