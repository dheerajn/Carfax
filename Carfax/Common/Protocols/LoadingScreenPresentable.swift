//
//  LoadingScreenPresentable.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

public protocol LoadingScreenPresentable: class {
    
    /// Shows activity indicatior
    func startLoadingAnimation()
    
    /// Removes activity indicator
    func removeLoadingAnimationFromSuperView()
}

extension LoadingScreenPresentable where Self: UIViewController {
    func startLoadingAnimation() {
        
        let loadingView: UIView = UIView()
        loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
        loadingView.center = self.view.center
        loadingView.backgroundColor = UIColor.lightGray
        loadingView.clipsToBounds = true
        loadingView.tag = Constants.activityIndicatorTag
        loadingView.layer.cornerRadius = 10
        self.view.addSubview(loadingView)
        
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        actInd.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        actInd.style = UIActivityIndicatorView.Style.white
        actInd.startAnimating()
        loadingView.addSubview(actInd)
    }
    
    func removeLoadingAnimationFromSuperView() {
        dispatchOnMainQueue {
            self.view.viewWithTag(Constants.activityIndicatorTag)?.removeFromSuperview()
        }
    }
}
