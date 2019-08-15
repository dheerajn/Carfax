//
//  UIViewExtension.swift
//  Carfax
//
//  Created by Dheeru on 8/15/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /// Add blur effect on top of the view
    ///
    /// - Returns: Returns view with new
    @discardableResult
    func addMediumBlurEffect() -> UIView {
        return addMediumBlurEffectView(false)
    }
    
    func addMediumBlurEffectView(_ animated: Bool) -> UIView {
        return addBlurEffectView(withBlurStyle: .light, aboveSubview: nil, andDarkAlpha: 0.15, animated: animated)
    }
    
    func addBlurEffectView(withBlurStyle blurStyle: UIBlurEffect.Style, aboveSubview subview: UIView?, andDarkAlpha darkAlpha: CGFloat, animated: Bool) -> UIView {
        // For the blur effect
        removeBlur()
        backgroundColor = UIColor.clear
        let blurContainerView = UIView()
        blurContainerView.frame = bounds
        blurContainerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let blurEffect = UIBlurEffect(style: blurStyle)
        let blurEffectView = UIVisualEffectView()
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurContainerView.addSubview(blurEffectView)
        if darkAlpha > 0.0 {
            let darkenView = UIView()
            darkenView.frame = blurEffectView.frame
            darkenView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            darkenView.backgroundColor = UIColor.black
            darkenView.alpha = darkAlpha
            blurContainerView.addSubview(darkenView)
        }
        if (subview != nil) {
            insertSubview(blurContainerView, aboveSubview: subview!)
        } else {
            insertSubview(blurContainerView, at: 0)
        }
        if animated {
            UIView.animate(withDuration: 0.5, animations: {
                blurEffectView.effect = blurEffect
            })
        } else {
            blurEffectView.effect = blurEffect
        }
        return blurContainerView
    }
    
    func removeBlur() {
        removeBlur(false)
    }
    
    func removeBlur(_ animated: Bool) {
        for subview: UIView in subviews {
            for view: UIView in subview.subviews {
                if (view is UIVisualEffectView) {
                    if animated {
                        UIView.animate(withDuration: 0.5, animations: {
                            (view as? UIVisualEffectView)?.effect = nil
                        }, completion: {(_ finished: Bool) in
                            subview.removeFromSuperview()
                        })
                    } else {
                        subview.removeFromSuperview()
                    }
                    return
                }
            }
        }
    }
    
}
