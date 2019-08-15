//
//  TableViewDelegateDataSourceConfigurable.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

public protocol TableViewDelegateDataSourceConfigurable {
    
    /// Number of rows to be displayed at give section
    var numberOfSections: Int { get}
    
    /// Returns Cell at particular indexPath
    ///
    /// - Parameters:
    ///   - row: 'row'
    ///   - section: 'secion'
    /// - Returns: ViewModel confirming CellConfigurable protocol
    func cellViewModel(row: Int, section: Int) -> CellConfigurable
    
    /// Calculate the number of rows in given section
    ///
    /// - Parameter section: section for which rows are asked
    /// - Returns: number of rows
    func rowsPerSection(_ section: Int) -> Int
    
    /// Returns header title for given section
    ///
    /// - Parameter section: section for which title is asked
    /// - Returns: Optional title value
    func headerTitleAt(section: Int) -> String?
    
    /// Returns header tag for given section
    ///
    /// - Parameter section: section for which title is asked
    /// - Returns: Optional title value
    func headerTagAt(_ section: Int) -> Int
    
    /// Returns footer title for give section
    ///
    /// - Parameter section:section for which title is asked
    /// - Returns:Optional title value
    func footerTitleAt(section: Int) -> String?
    
    /// Returns rows height for given section
    ///
    /// - Parameter section: section for which height is asked
    /// - Returns: row height
    func heightForRowAt(row: Int, section: Int) -> CGFloat
    
    /// Returns header height for given section
    ///
    /// - Parameter section: section for which height is asked
    /// - Returns: header height for section
    func heightForHeaderAt(section: Int) -> CGFloat
    
    /// Returns footer height for given section
    ///
    /// - Parameter section: section for which height is asked
    /// - Returns: footer height for section
    func heightForFooterAt(section: Int) -> CGFloat
    
    
    /// Track user action on given row
    ///
    /// - Parameters:
    ///   - row: row tapped
    ///   - section: section in which row is tapped
    func didSelectRowAt(row: Int, section: Int)
    
    /// Returns the section header view
    ///
    /// - Parameter section: section ID
    /// - Returns: section header UIView
    func headerViewForSectionAt(section: Int) -> UIView?
    
    /// Returns the section footer view
    ///
    /// - Parameter section: section ID
    /// - Returns: section header UIView
    func footerViewForSectionAt(section: Int) -> UIView?
    
    /// Based on configuration in enum OR dyanmic: - get specific reuse ID for cell at particular section OR row
    ///
    /// - Parameters:
    ///   - row: row tapped
    ///   - section: section in which row is tapped
    /// - Returns: String - ReuseID for the cell
    func cellReuseID(row: Int, section: Int) -> String
    
    /// Takes the font we specify in the view model
    ///
    /// - Parameter section: section in which row is tapped
    /// - Returns: Returns UIFont
    func headerFontAt(section: Int) -> UIFont?
}

public extension TableViewDelegateDataSourceConfigurable {
    var numberOfSections: Int { return 0 }
    func cellViewModel(row: Int, section: Int) -> CellConfigurable { return PlaceholderCellViewModel() }
    func rowsPerSection(_ section: Int) -> Int { return 1 }
    func headerTagAt(_ section: Int) -> Int { return 0 }
    func headerTitleAt(section: Int) -> String? { return nil}
    func footerTitleAt(section: Int) -> String? { return nil }
    func heightForRowAt(row: Int, section: Int) -> CGFloat { return 30 }
    func headerViewForSectionAt(section: Int) -> UIView? { return nil }
    func footerViewForSectionAt(section: Int) -> UIView? { return nil }
    func heightForHeaderAt(section: Int) -> CGFloat { return 0.0001 }
    func heightForFooterAt(section: Int) -> CGFloat { return 0.0001 }
    func didSelectRowAt(row: Int, section: Int) {}
    func headerFontAt(section: Int) -> UIFont? { return nil }
}
