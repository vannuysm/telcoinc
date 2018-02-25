//
//  SearchDelegate.swift
//  telcoinc
//
//  Created by Charles Chandler on 2/25/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit
import SAPFiori

protocol SearchDelegateDelegate: class {
    func didSelect(worksite: Worksite)
}

class SearchDelegate: NSObject, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    private var tableView: UITableView!
    private var searchBar: UISearchBar!
    
    public var worksites: [Worksite] = []
    
    public weak var delegate: SearchDelegateDelegate?
    
    init(tableView: UITableView, searchBar: UISearchBar) {
        self.tableView = tableView
        self.searchBar = searchBar
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worksites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        
        let worksite = worksites[indexPath.row]
        
        cell.headlineLabel.text = worksite.salesOrderHeader.customerID
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let worksite = worksites[indexPath.row]
        
        searchBar.resignFirstResponder()
        
        delegate?.didSelect(worksite: worksite)
    }
    
    // MARK: - UISearcBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        tableView.reloadData()
    }
    
}
