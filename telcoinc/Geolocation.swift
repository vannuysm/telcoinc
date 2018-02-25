//
//  Geolocation.swift
//  telcoinc
//
//  Created by Matt VanNuys on 2/25/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import Foundation

public class Geolocation {
    public private(set) var latitude: Decimal
    public private(set) var longitude: Decimal
    
    public init(latitude: Decimal, longitude: Decimal) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
