//
//  DetailViewController.swift
//  telcoinc
//
//  Created by Cedric G on 25/02/2018.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit
import SAPFiori
import SAPOData

class DetailViewController: AbstractViewController {
    
    var objectHeader: FUIObjectHeader!
    
    var data: [SalesOrderItem] = []
    
    var orderId: String!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    convenience init(_ orderId: String) {
        self.init()
        self.orderId = orderId
    }
    
    fileprivate init() {
        super.init(nibName: "DetailViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        
        objectHeader = FUIObjectHeader()
        
        tableView.tableHeaderView = objectHeader
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        
        if let objectHeader = tableView.tableHeaderView as? FUIObjectHeader {
            
            objectHeader.headlineText = "Inspect electric pump motor"
            objectHeader.subheadlineText = "Job 819701"
            objectHeader.tags = [FUITag(title: "Started"), FUITag(title:"PM01"), FUITag(title:"103-Repair")]
            objectHeader.bodyText = "1000-Hamburg\nMECHANIC"
            objectHeader.bodyLabel.numberOfLines = 2 // Set number of lines for this example
            objectHeader.footnoteText = "Due on 12/31/16"
            //objectHeader.descriptionText = "Temperature sensor predicts overheating failure in 4 days. Urgent and needs attention!"
            objectHeader.statusText = "High"
            //objectHeader.detailImage = UIImage() // TODO: Replace with your image
            //objectHeader.substatusImage = UIImage() // TODO: Replace with your image
            
            // Image View as example for a detail content view
            //let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 800, height: 200))
            //imageView.image = UIImage() // TODO: Replace with your image
            //objectHeader.detailContentView = imageView
            
        }
        
        loadData()
    }
    
    //MARK: DATA
    
    func loadData() {
        let query = DataQuery()
            .filter(SalesOrderItem.salesOrderID.equal(orderId))
         provider.fetchSalesOrderItems(matching: query) { (items, error) in
            //var item = items?.first
            self.data = items ?? []
            self.tableView.reloadData()
            print("")
        }
    }
    
    //MARK: Action
    
    @IBAction func closeAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        
        let item = data[indexPath.row]
        
        let number = item.itemNumber ?? 0
        cell.headlineText = "Item \(number)"
        cell.subheadlineText = item.productID ?? ""//"HT-1061"
        let netAmout = item.netAmount?.doubleValue() ?? 0
        let currency = item.currencyCode ?? ""
        cell.statusText = "\(netAmout) \(currency)"//"7.00 USD"
        cell.substatusText = "In Stock"
        cell.substatusLabel.textColor = .preferredFioriColor(forStyle: .positive)
        cell.accessoryType = .none
        cell.splitPercent = CGFloat(0.3)
        
        return cell
    }
    
    //MARK: UITableViewDelegate
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    */
    
}
