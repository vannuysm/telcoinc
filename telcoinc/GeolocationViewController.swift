//
//  GeolocationViewController.swift
//  telcoinc
//
//  Created by Matt VanNuys on 2/25/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import Foundation
import UIKit

class GeolocationViewController: UIViewController {
    @IBOutlet weak var latitudeValue: UILabel!
    @IBOutlet weak var longitudeValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = GeolocationFixture.create()
        latitudeValue.text = location.latitude.description
        longitudeValue.text = location.longitude.description
    }
}
