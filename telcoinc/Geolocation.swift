//
//  Geolocation.swift
//  telcoinc
//
//  Created by Matt VanNuys on 2/25/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import Foundation
import CoreLocation

public class Geolocation {
    public private(set) var latitude: Double
    public private(set) var longitude: Double
    
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
    }
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
