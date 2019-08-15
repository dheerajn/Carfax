//
//  CarfaxDetailsViewController.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

class CarfaxDetailsViewController: BaseViewController {
    @IBOutlet weak var blurredImageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CarfaxViewModelConfigurable! {
        didSet {
            viewModel.delegate = self
        }
    }
    fileprivate var tableViewDelDataSource: TableViewDelegateAndDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.navigationController?.navigationBar.barStyle = UIBarStyle.default
    }
}

// MARK: - Helper method
extension CarfaxDetailsViewController {
    func setupUI() {
        self.title = viewModel.screenTitle
        
        let _ = self.blurredImageView.addMediumBlurEffect()

        self.tableView.backgroundColor = UIColor.clear
        self.tableView.register([DetailsTableViewCell.reuseID()])
        
        self.tableViewDelDataSource  = TableViewDelegateAndDataSource(viewModel: viewModel)
        self.tableView.delegate = self.tableViewDelDataSource
        self.tableView.dataSource = self.tableViewDelDataSource
    }
}

// MARK: - CarfaxViewModelDelegate
extension CarfaxDetailsViewController: CarfaxViewModelDelegate {
    func reloadData() {
        self.tableView.reloadData()
    }
}
