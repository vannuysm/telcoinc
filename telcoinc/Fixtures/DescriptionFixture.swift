//
//  GeolocationFixture.swift
//  telcoinc
//
//  Created by Matt VanNuys on 2/25/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import Foundation

public class DescriptionFixture {
    private static let VALID_CHARACTERS: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    private static let VALID_CHARACTERS_LENGTH = UInt32(VALID_CHARACTERS.length)
    
    public static func create() -> String {
        let wordCount = generateNumber(upperBound: 20)
        
        var description = ""
        
        for _ in 0...wordCount {
            description += generateWord() + " "
        }
        
        return String(description[..<description.endIndex])
    }
    
    private static func generateWord() -> String {
        let characterCount = generateNumber(upperBound: 12)

        var word = ""
        
        for _ in 0 ..< characterCount {
            let rand = arc4random_uniform(VALID_CHARACTERS_LENGTH)
            var nextChar = VALID_CHARACTERS.character(at: Int(rand))
            word += NSString(characters: &nextChar, length: 1) as String
        }
        
        return word
    }
    
    private static func generateNumber(upperBound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperBound))) + 1
    }
}

