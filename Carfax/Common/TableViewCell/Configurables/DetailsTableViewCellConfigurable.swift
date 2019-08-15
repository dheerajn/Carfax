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
    var yearMakeModelText: String? { get }
    var trimText: String? { get }
    var mileageText: String? { get }
    var priceText: String? { get }
    var callButtonText: String? { get }
    var locationText: String? { get }
    var imageUrl: String? { get }
    func callButtonAction()
    func locationButtonTapped()
}
