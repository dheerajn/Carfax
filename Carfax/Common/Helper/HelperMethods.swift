//
//  HelperMethods.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation

// Executes the closure on the main queue after the given delay.
///
/// - Parameters:
///   - delay: Delay in seconds
///   - closure: Code to be executed after the delay.
public func dispatchOnMainQueueWith(delay: Double, closure: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: TimeInterval.convertToDispatchTimeT(delay), execute: closure)
}

/// Executes the closure on the main queue.
///
/// - Parameter closure: Code to be executed.
public func dispatchOnMainQueue(closure: @escaping ()->()) {
    DispatchQueue.main.async(execute: closure)
}

public extension TimeInterval {
    static func convertToDispatchTimeT(_ time: TimeInterval?) -> DispatchTime {
        let absolutePause: TimeInterval = time ?? TimeInterval(0.0)
        return .now() + absolutePause
    }
}
