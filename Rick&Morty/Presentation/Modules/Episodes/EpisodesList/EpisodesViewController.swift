//
//  EpisodesViewController.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 11/11/22.
//

import UIKit

class EpisodesViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var episodesTableView: UITableView!
    @IBOutlet weak var goToTopButton: UIButton!
    
    //MARK: Properties
    var viewModel: EpisodesViewModel! {
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
        setupUI()
        configureSearchBar()
        configureTableView(episodesTableView.self)
        viewModel.getEpisodesList(searchTextInput: viewModel.searchText) {
            self.episodesTableView.reloadData()
        }
    }

    
    //MARK: Functions
    private func setupUI() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        goToTopButton.layer.cornerRadius = 16
    }
    
    private func setupViewModel() {
        guard let viewModel = viewModel else { return }
    }

    //MARK: IBActions
    @IBAction func goToTopAction(_ sender: Any) {
        self.episodesTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}
