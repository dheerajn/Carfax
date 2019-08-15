//
//  CarfaxViewModelConfigurable.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation

public protocol CarfaxViewModelConfigurable: TableViewDelegateDataSourceConfigurable {
    var screenTitle: String { get }
}
