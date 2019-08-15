//
//  CarfaxDispatcher.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation

/// This singleton class is helpful when we have different schemes like Debug/Local and Prod. Depending on the switch, we can change the logic to take the local file or make service call.
class CarfaxDispatcher {
    static var shared = CarfaxDispatcher()
    
    /// This will get the Carfax detials.
    ///
    /// - Parameter completionHandler: Result of the service call
    func getCarfaxDetails(completionHandler: @escaping CarfaxCompHandler) {
        //        let service = GetLocalDebugData() : MakeSereviceCall()
        let service = CarfaxDetialsServiceCall()
        service.getCarfaxDetails(completionHandler: completionHandler)
    }
}
