//
//  DetailViewController.swift
//  telcoinc
//
//  Created by Cedric G on 25/02/2018.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit
import SAPFiori

class DetailViewController: UIViewController {
    
    var objectHeader: FUIObjectHeader!
    
    @IBOutlet weak var tableView: UITableView!
    
    init() {
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
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        
        if let objectHeader = tableView.tableHeaderView as? FUIObjectHeader {
            
            objectHeader.headlineText = "Inspect electric pump motor"
            objectHeader.subheadlineText = "Job 819701"
            objectHeader.tags = [FUITag(title: "Started"), FUITag(title:"PM01"), FUITag(title:"103-Repair")]
            objectHeader.bodyText = "1000-Hamburg\nMECHANIC"
            objectHeader.bodyLabel.numberOfLines = 2 // Set number of lines for this example
            objectHeader.footnoteText = "Due on 12/31/16"
            objectHeader.descriptionText = "Temperature sensor predicts overheating failure in 4 days. Urgent and needs attention!"
            objectHeader.statusText = "High"
            //objectHeader.detailImage = UIImage() // TODO: Replace with your image
            //objectHeader.substatusImage = UIImage() // TODO: Replace with your image
            
            // Image View as example for a detail content view
            //let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 800, height: 200))
            //imageView.image = UIImage() // TODO: Replace with your image
            //objectHeader.detailContentView = imageView
            
        }
        
    }
    
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: UITableViewDataSource
    
    /*func numberOfSections(in tableView: UITableView) -> Int {
        return
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        return cell
    }
    
    //MARK: UITableViewDelegate
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
    }*/
    
    
}
