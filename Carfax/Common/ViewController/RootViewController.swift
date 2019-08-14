//
//  RootViewController.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

class RootViewController: BaseViewController {
    
    var flowDelegate: CarfaxFlowDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.flowDelegate = CarfaxFlowController(navigationController: self.navigationController!)
        self.setStatusBar()
    }
}
