//
//  CarfaxDetailsViewModel.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation

//• Vehicle photo
//• Year, make, model, trim • Price
//• Mileage
//• Location
//• Call dealer button

class CarfaxDetailsViewModel: CarfaxViewModelConfigurable {
    
    init(flowDelegate: CarfaxFlowDelegate) {
        self.getCarsDetials()
    }
    
    var screenTitle: String {
        return "CARFAX DATA"
    }
}

// MARK: - TableViewDelegateDataSourceConfigurable
extension CarfaxDetailsViewModel {
    func cellReuseID(row: Int, section: Int) -> String {
        return ""
    }
}

// MARK: - Helper methods
extension CarfaxDetailsViewModel {
    func getCarsDetials() {
        CarfaxDispatcher.shared.getCarfaxDetails { (result) in
            switch result {
            case .success(let carsData):
                print(carsData)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
