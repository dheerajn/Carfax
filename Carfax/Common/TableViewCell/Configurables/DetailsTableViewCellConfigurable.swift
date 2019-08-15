//
//  DetailsTableViewCellConfigurable.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

public protocol DetailsTableViewCellConfigurable: CellConfigurable {
    
    /// String for year, make, and model
    var yearMakeModelText: String? { get }
    
    /// String for trim
    var trimText: String? { get }
    
    /// String for mileage
    var mileageText: String? { get }
    
    /// String for Price
    var priceText: String? { get }
    
    /// String for Phone number
    var callButtonText: String? { get }
    
    /// String for Location
    var locationText: String? { get }
    
    /// Url string to download image from
    var imageUrl: String? { get }
    
    /// This method gets called when user taps on Number button
    func callButtonAction()
    
    /// This method gets called when user taps on location button
    func locationButtonTapped()
}
