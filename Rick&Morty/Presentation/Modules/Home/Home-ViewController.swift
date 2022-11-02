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
        configureTableView(tableView.self)
        viewModel.executeAPICalls()
        viewModel.executeAPI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: Functions
    
    //MARK: IBActions


}

