//
//  CarfaxViewModelConfigurable.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation

public protocol CarfaxViewModelConfigurable: TableViewDelegateDataSourceConfigurable {
    
    /// This will help us communicating with the view controller
    var delegate: CarfaxViewModelDelegate? { get set }
    
    /// This will show the title for the view controller
    var screenTitle: String { get }
}

public protocol CarfaxViewModelDelegate: LoadingScreenPresentable {
    
    /// Reload the table view
    func reloadData()
}
