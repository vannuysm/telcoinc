//
//  GeolocationFixture.swift
//  telcoinc
//
//  Created by Matt VanNuys on 2/25/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import Foundation

public class GeolocationFixture {
    private static let LATITUDE_LOWER_BOUND = Double(41.3838005695);
    private static let LATITUDE_UPPER_BOUND = Double(41.4468805643);
    
    private static let LONGITUDE_LOWER_BOUND = Double(2.1400831772);
    private static let LONGITUDE_UPPER_BOUND = Double(2.1970747544);
    
    
    public static func create() -> Geolocation {
        let latitude = randomBetweenNumbers(firstNum: LATITUDE_LOWER_BOUND, secondNum: LATITUDE_UPPER_BOUND)
        let longitude = randomBetweenNumbers(firstNum: LONGITUDE_LOWER_BOUND, secondNum: LONGITUDE_UPPER_BOUND)
        
        return Geolocation(latitude: latitude, longitude: longitude)
    }
    
    private static func randomBetweenNumbers(firstNum: Double, secondNum: Double) -> Double {
        return Double(arc4random()) / Double(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}
