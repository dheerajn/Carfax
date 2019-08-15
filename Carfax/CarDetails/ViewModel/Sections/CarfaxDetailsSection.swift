//
//  CarfaxDetailsSection.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation

/// This class is responsible for showing the sections depending on the logic we have. This come handy when we have so many different sections.
enum CarfaxDetailsSection: Int {
    case details = 0
    
    static var normal: [[CarfaxDetailsSection: [String]]] {
        return [[.details: [DetailsTableViewCell.reuseID()]]]
    }
    
    private static func sections() -> [[CarfaxDetailsSection:[String]]] {
        return CarfaxDetailsSection.normal
    }
    
    public func cellReuseID(row: Int) -> String {
        let sections = CarfaxDetailsSection.sections()
        let index = sections.firstIndex(where:{$0.keys.first == self}) ?? 0
        guard let cellIDs = sections[index].values.first, cellIDs.count > row else {
            return sections[index].values.first?.first ?? "Invalid reuseID"
        }
        return sections[index].values.first?[row] ?? "Invalid reuseID"
    }
    
    static func currentSection(rawValue: Int) -> CarfaxDetailsSection {
        return CarfaxDetailsSection.sections()[rawValue].keys.first!
    }
    
    static func numberOfSections() -> Int {
        return sections().count
    }
}
