//
//  UITableViewExtension.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    public func register(_ nibs: [String]?, inBundle bundle: Bundle? = nil) {
        if let nibArray = nibs {
            for nibName in nibArray {
                self.register(UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: nibName)
            }
        }
    }
}
