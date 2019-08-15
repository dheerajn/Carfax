//
//  CellViewConfigurable.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation

public protocol CellViewConfigurable {
    var viewModel: CellConfigurable! { get set }
    static func reuseID() -> String
}

extension CellViewConfigurable {
    
}
