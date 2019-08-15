//
//  CarfaxDetailsViewModel.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

//• Vehicle photo
//• Year, make, model,
//• trim
//• Price
//• Mileage
//• Location
//• Call dealer button

class CarfaxDetailsViewModel: CarfaxViewModelConfigurable {
    
    fileprivate var flowDelegate: CarfaxFlowDelegate?
    weak var delegate: CarfaxViewModelDelegate?
    fileprivate var carfaxData: CarFaxData?
    
    init(flowDelegate: CarfaxFlowDelegate?) {
        self.getCarsDetials()
    }
    
    var screenTitle: String {
        return "CARFAX DATA"
    }
}

// MARK: - TableViewDelegateDataSourceConfigurable
extension CarfaxDetailsViewModel {
    var numberOfSections: Int {
        return CarfaxDetailsSection.numberOfSections()
    }
    
    func rowsPerSection(_ section: Int) -> Int {
        let dereferencedSections = CarfaxDetailsSection.currentSection(rawValue: section)
        
        switch dereferencedSections {
        case .details:
            return self.carfaxData?.listings?.count ?? 0
        }
    }
    
    func cellViewModel(row: Int, section: Int) -> CellConfigurable {
        let dereferencedSections = CarfaxDetailsSection.currentSection(rawValue: section)
        switch dereferencedSections {
        case .details:
            guard let validListing = self.carfaxData?.listings, let currentListing = validListing[safe: row] else { return PlaceholderCellViewModel() }
            
            let viewModel = CarfaxDetailsCellViewModel(year: currentListing.year,
                                                       make: currentListing.make ?? "",
                                                       model: currentListing.model ?? "",
                                                       trim: currentListing.trim ?? "",
                                                       mileage: currentListing.mileage,
                                                       price: currentListing.currentPrice,
                                                       callButtonText: currentListing.dealer?.phone ?? "",
                                                       imageUrl: currentListing.images?.firstPhoto?.medium,
                                                       location: currentListing.dealer)
            return viewModel
        }
    }
    
    func heightForRowAt(row: Int, section: Int) -> CGFloat {
        return Constants.Numbers.tableViewCellHeight
    }
    
    func cellReuseID(row: Int, section: Int) -> String {
        let rawValueSection = CarfaxDetailsSection.currentSection(rawValue: section)
        return rawValueSection.cellReuseID(row:row)
    }
    
    func didSelectRowAt(row: Int, section: Int) {
        
    }
}

// MARK: - Helper methods
extension CarfaxDetailsViewModel {
    func getCarsDetials() {
        dispatchOnMainQueueWith(delay: 0.1) {
            self.delegate?.startLoadingAnimation()
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        CarfaxDispatcher.shared.getCarfaxDetails { (result) in
            switch result {
            case .success(let carsData):
                self.carfaxData = carsData
                if let validlisting = self.carfaxData?.listings {
                    self.carfaxData?.listings = validlisting.sorted { Int($0.year ?? 0) > Int($1.year ?? 1) }
                }
                dispatchOnMainQueue {
                    self.delegate?.reloadData()
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    self.delegate?.removeLoadingAnimationFromSuperView()
                }
                
            case .failure(let error):
                dispatchOnMainQueue {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    self.delegate?.removeLoadingAnimationFromSuperView()
                }
                print(error.localizedDescription)
            }
        }
    }
}
