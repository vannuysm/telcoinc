//
//  AbstractViewController.swift
//  telcoinc
//
//  Created by Cedric G on 25/02/2018.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit
import SAPFioriFlows
import SAPFoundation
import SAPCommon
import SAPOData

class AbstractViewController: UIViewController {
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var provider: ESPMContainer<OnlineODataProvider> {
        return appDelegate.espmContainer
    }
    
    
    
}
