//
//  NavigationControllerAnimationPresentable.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

public protocol NavigationFlowControllable: class {
    
    /// Navigation Controller access
    var navigationController: UINavigationController? { get set }
}

public enum NavigationAnimationType: String {
    case fade
    case moveIn
    case push
    case reveal
}

public protocol NavigationControllerAnimationPresentable: NavigationFlowControllable {
    
    /// This is a navigation animation helps especially when you work on Modals. This is a navigation push, but animation looks like navigation present.
    ///
    /// - Parameter viewController: ViewController that needs to be pushed.
    func pushViewControllerWithAnimation(_ viewController: UIViewController, withAnimationType animation: NavigationAnimationType)
    
    /// This pops the top view controller
    func popViewControllerWithAnimation(withAnimationType animation: NavigationAnimationType)
}

public extension NavigationControllerAnimationPresentable {
    func pushViewControllerWithAnimation(_ viewController: UIViewController, withAnimationType animation: NavigationAnimationType) {
        let transition: CATransition = self.transition(withAnimation: animation)
        transition.subtype = CATransitionSubtype.fromRight
        
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.pushViewController(viewController, animated: false)
    }
    
    func popViewControllerWithAnimation(withAnimationType animation: NavigationAnimationType) {
        let transition: CATransition = self.transition(withAnimation: animation)
        transition.subtype = CATransitionSubtype.fromBottom
        
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.popViewController(animated: false)
    }
    
    fileprivate func transition(withAnimation animation: NavigationAnimationType) -> CATransition {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        switch animation {
        case .moveIn:
            transition.type = CATransitionType.moveIn
        case .fade:
            transition.type = CATransitionType.fade
        case .push:
            transition.type = CATransitionType.push
        case .reveal:
            transition.type = CATransitionType.reveal
        }
        return transition
    }
}
