//
//  BaseViewController.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, AlertViewPresentable, LoadingScreenPresentable {
    
    open var initialLoad: Bool = true
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override open var shouldAutorotate: Bool {
        return true
    }
    
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeNavigationBarTransparent()
        view.backgroundColor = UIColor.white
        setupNavigationTitleProperties()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    open func makeNavigationBarTransparent() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func setupNavigationTitleProperties(withColor color: UIColor = UIColor.black) {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
    }
    
    open func hideLeftNavBarButton() {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    open func setStatusBar() {
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
    }
    
    open func resetStatusBar() {
        self.navigationController?.navigationBar.barStyle = UIBarStyle.default
    }
    
    deinit {
        print("\(self.description.debugDescription) deinitialized")
    }
}
