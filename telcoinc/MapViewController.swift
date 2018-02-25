//
//  MapViewController.swift
//  telcoinc
//
//  Created by Charles Chandler on 2/25/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit
import SAPFiori

class MapViewController: UIViewController {
    
    @IBOutlet var mapViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapViewHeightConstraint.constant = UIScreen.main.bounds.height
    }
    
}
