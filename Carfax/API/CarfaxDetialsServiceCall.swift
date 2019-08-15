//
//  CarfaxDetialsServiceCall.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation

public protocol CarfaxDetialsRestCall {
    
    /// Makes the service call to the Carfax Data
    ///
    /// - Parameter completionHandler: Result of the service call
    func getCarfaxDetails(completionHandler: @escaping CarfaxCompHandler)
}

//This is just for the test, but in the real time project we can use cocoapods and much generic way
class CarfaxDetialsServiceCall: CarfaxDetialsRestCall {
    func getCarfaxDetails(completionHandler: @escaping CarfaxCompHandler) {
        let moviesUrl = "https://carfax-for-consumers.firebaseio.com/assignment.json"
        guard let url = URL(string: moviesUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let carsData = try decoder.decode(CarFaxData.self, from: data)
                return completionHandler(.success(carsData))
            } catch let err {
                print(err.localizedDescription)
                return completionHandler(.failure(CarfaxApiError.deserialisingFailed))
            }
            }.resume()
    }
}
