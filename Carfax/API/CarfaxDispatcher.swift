//
//  CarfaxDispatcher.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation

class CarfaxDispatcher {
    static var shared = CarfaxDispatcher()
    
    func getCarfaxDetails(completionHandler: @escaping CarfaxCompHandler) {
        let service = CarfaxDetialsServiceCall()
        service.getCarfaxDetails(completionHandler: completionHandler)
    }
}
