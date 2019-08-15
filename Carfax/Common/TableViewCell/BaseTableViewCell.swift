//
//  BaseTableViewCell.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

open class BaseTableViewCell: UITableViewCell {
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}

