//
//  Worksite.swift
//  telcoinc
//
//  Created by Charles Chandler on 2/25/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import Foundation
import MapKit
import SAPFiori

class Worksite: MKPointAnnotation {
    
    public var salesOrderHeader: SalesOrderHeader
    
    init(salesOrderHeader: SalesOrderHeader) {
        self.salesOrderHeader = salesOrderHeader
        
        super.init()
        
        self.coordinate = GeolocationFixture.create().coordinate
    }
    
}

class WorksiteMarker: FUIMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            markerTintColor = UIColor.preferredFioriColor(forStyle: .map1)
            glyphImage = FUIIconLibrary.map.marker.venue.withRenderingMode(.alwaysTemplate)
            displayPriority = .defaultLow
            priorityIcon =  FUIIconLibrary.map.marker.veryHighPriority
        }
    }
    
    var worksite: Worksite?
    
}

