//
//  TableViewDelegateAndDataSource.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit

public typealias ViewConfigurableTableViewCell = CellViewConfigurable & UITableViewCell

open class TableViewDelegateAndDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    open var viewModel: TableViewDelegateDataSourceConfigurable!
    
    public init(viewModel: TableViewDelegateDataSourceConfigurable) {
        self.viewModel = viewModel
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowsPerSection(section)
    }
    
    open func  numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    open func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseID = viewModel.cellReuseID(row: indexPath.row, section: indexPath.section)
        
        if cellReuseID.isEmpty == true {
            #if DEBUG
            fatalError("Cell reuse ID is empty for indexPath: \(indexPath) in \(self.debugDescription)")
            #endif
        }
        guard var  cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath) as? ViewConfigurableTableViewCell else { return UITableViewCell() }
        let height = viewModel.heightForRowAt(row: indexPath.row, section: indexPath.section)
        cell.isHidden = (height == 0) ? true : false
        let cellVM = viewModel.cellViewModel(row: indexPath.row, section: indexPath.section)
        cell.viewModel = cellVM
        return cell
    }
    
    open func  tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor.clear
    }
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView =  viewModel.headerViewForSectionAt(section: section) {
            return headerView
        }
        
        //FIXME: This code need to move to viewModel
        //        let title = viewModel.headerTitleAt(section: section)
        //        let font = viewModel.headerFontAt(section: section)
        return UIView()
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if let headerView =  viewModel.footerViewForSectionAt(section: section) {
            return headerView
        }
        return UIView()
    }
    
    open func  tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    open func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(row:indexPath.row, section: indexPath.section)
    }
    
    open func  tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.heightForHeaderAt(section: section)
    }
    
    open func  tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return viewModel.heightForFooterAt(section: section)
    }
    
    open func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(row: indexPath.row, section: indexPath.section)
    }
}

