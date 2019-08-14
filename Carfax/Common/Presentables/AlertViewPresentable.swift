//
//  AlertViewPresentable.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

public protocol AlertViewPresentable {
    func displayAlertWithTitle(_ title: String?, message: String?, andActions actions: [CustomAlertAction]?)
}

public extension AlertViewPresentable {
    func displayAlertWithTitle(_ title: String?, message: String?, andActions actions: [CustomAlertAction]?) {
        CustomAlertController().displayAlertWithTitle(title,
                                                      message: message,
                                                      preferredStyle: UIAlertController.Style.alert,
                                                      andActions: actions)
    }
}

