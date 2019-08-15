//
//  UIImageExtension.swift
//  Carfax
//
//  Created by Dheeru on 8/15/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation

import UIKit

public extension UIImage {
    static var DefaultImage: UIImage {
        guard let validDefaultImage = UIImage(named: "PlaceholderImage") else { return UIImage() }
        return validDefaultImage
    }
}
