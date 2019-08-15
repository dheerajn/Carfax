//
//  DetailsTableViewCell.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import UIKit

public protocol DetailsTableViewCellConfigurable: CellConfigurable {
    
}

class DetailsTableViewCell: BaseTableViewCell, CellViewConfigurable {

    var viewModel: CellConfigurable! {
        didSet {
            guard let vm = viewModel as? DetailsTableViewCellConfigurable else { return }
            
            dispatchOnMainQueue {
     
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func reuseID() -> String {
        return "DetailsTableViewCell"
    }
}
