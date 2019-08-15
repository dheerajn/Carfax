//
//  CarfaxDetailsCellViewModel.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

class CarfaxDetailsCellViewModel: DetailsTableViewCellConfigurable {
    
    fileprivate var callbuttonTextLocal: String?
    
    init(year: Int?, make: String, model: String, trim: String?, mileage: Int?, price: Int?, callButtonText: String?) {
        self.yearMakeModelText = String(year ?? 0) + " " + make + " " + model
        self.trimText = "Trim: " + (trim ?? "Not Available")
        self.mileageText = "Mileage: " + String(mileage ?? 0)
        self.priceText = "Price: " + String(price ?? 0)
        self.callbuttonTextLocal = callButtonText
    }
    
    var yearMakeModelText: String?
    var trimText: String?
    var mileageText: String?
    var priceText: String?
    var locationText: String?
    
    var callButtonText: String? {
        return callbuttonTextLocal
    }
    
    func callButtonAction() {
        guard let validNumber = self.callButtonText, let url = URL(string: validNumber) else { return }
        if UIApplication.shared.canOpenURL(url) == true {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}