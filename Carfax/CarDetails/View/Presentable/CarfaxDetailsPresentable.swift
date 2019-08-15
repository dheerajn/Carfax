//
//  CarfaxDetailsPresentable.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

public protocol CarfaxDetailsPresentable {
    
    /// This method will show the Carfax landing view
    ///
    /// - Parameter viewModel: ViewModel for the view controlle
    func showCarfaxDetails(viewModel: CarfaxViewModelConfigurable)
}

public extension CarfaxDetailsPresentable where Self: CarfaxFlowController {
    func showCarfaxDetails(viewModel: CarfaxViewModelConfigurable) {
        let storyboard = UIStoryboard(name: Constants.ViewControllers.mainStoryboardIdentifier, bundle: nil)
        let movieListVc = storyboard.instantiateViewController(withIdentifier: Constants.ViewControllers.carfaxDetailsViewController) as? CarfaxDetailsViewController
        movieListVc?.viewModel = viewModel
        movieListVc?.hideLeftNavBarButton()
        
        dispatchOnMainQueue {
            self.pushViewControllerWithAnimation(movieListVc!, withAnimationType: .fade)
        }
    }
}
