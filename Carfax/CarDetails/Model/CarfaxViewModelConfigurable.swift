//
//  CarfaxViewModelConfigurable.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation

public protocol CarfaxViewModelConfigurable: TableViewDelegateDataSourceConfigurable {
    var delegate: CarfaxViewModelDelegate? { get set }
    var screenTitle: String { get }
}

public protocol CarfaxViewModelDelegate: LoadingScreenPresentable {
    func reloadData()
}
