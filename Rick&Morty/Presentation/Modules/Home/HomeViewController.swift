//
//  HomeViewController.swift
//  Rick&Morty
//
//  Created by Jorge Miguel on 2/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties
    let viewModel = HomeViewModel()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Rick & Morty"
        configureTableView(tableView.self)
        viewModel.getCharactersList {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: Functions
    
    //MARK: IBActions
}

