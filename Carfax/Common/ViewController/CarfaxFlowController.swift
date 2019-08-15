//
//  CarfaxFlowController.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

public protocol CarfaxFlowDelegate: NavigationControllerAnimationPresentable, CarfaxDetailsPresentable {}

/// This is responsible for navigating views
public class CarfaxFlowController: CarfaxFlowDelegate {
    
    public var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        let viewModel = CarfaxDetailsViewModel(flowDelegate: self)
        self.showCarfaxDetails(viewModel: viewModel)
    }
}
