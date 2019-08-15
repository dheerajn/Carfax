//
//  ServiceHelper.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation

/// This enum helps showing the error when we revcieve from the API for any reason. Here are some of the types of error we can use.
///
/// - noData: This say that we dont have any data
/// - invalidURL: This says the url we entered is invalid
/// - invalidFormat: This says the format we sent is invalid
/// - otherError: This can be of type any Swift error
/// - deserialisingFailed: This says that deserialising failed
public enum CarfaxApiError: Error {
    case noData
    case invalidURL(urlString: String)
    case invalidFormat(string: String)
    case otherError(error: Swift.Error)
    case deserialisingFailed
}


/// This enum helps showing the result when we get after the data is parsed
///
/// - success: For now this is of type "CarFaxData" but we can still change this
/// - failure: This is a custom error used depending on the scenario
public enum CarfaxApiResultType<T,E>{
    case success(T)
    case failure(E)
}

public typealias CarfaxResult = CarfaxApiResultType<CarFaxData, CarfaxApiError>
public typealias CarfaxCompHandler = (CarfaxResult) -> Void
