//
//  DetailsTableViewCell.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsTableViewCell: BaseTableViewCell, CellViewConfigurable {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var location: UIButton!
    @IBOutlet weak var trim: UILabel!
    @IBOutlet weak var yearMakeModel: UILabel!
    @IBOutlet weak var mileage: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var callButton: UIButton!
    
    var imageUrl: String? {
        didSet {
            guard let validImageUrl = imageUrl else { return }
            
            self.mainImageView.downloadImage(forUrl: validImageUrl, defaultImage: UIImage.DefaultImage, completionBlock: nil)
        }
    }
    var viewModel: CellConfigurable! {
        didSet {
            guard let vm = viewModel as? DetailsTableViewCellConfigurable else { return }
            
            dispatchOnMainQueue {
                self.trim.text = vm.trimText
                self.yearMakeModel.text = vm.yearMakeModelText
                self.mileage.text = vm.mileageText
                self.price.text = vm.priceText
                self.callButton.setTitle(vm.callButtonText, for: UIControl.State.normal)
                self.imageUrl = vm.imageUrl
                self.location.setTitle(vm.locationText, for: UIControl.State.normal)
                
                self.location.titleLabel?.adjustsFontSizeToFitWidth = true
                self.location.titleLabel?.minimumScaleFactor = 0.5
                self.location.titleLabel?.numberOfLines = 0
                self.location.contentHorizontalAlignment = .left
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
    
    @IBAction func callButtonAction(_ sender: Any) {
        (self.viewModel as? DetailsTableViewCellConfigurable)?.callButtonAction()
    }
    
    @IBAction func locationButtonTapped(_ sender: UIButton) {
        (self.viewModel as? DetailsTableViewCellConfigurable)?.locationButtonTapped()
    }
    
    static func reuseID() -> String {
        return "DetailsTableViewCell"
    }
}
