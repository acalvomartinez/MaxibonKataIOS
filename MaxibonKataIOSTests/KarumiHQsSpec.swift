//
//  KarumiHQsSpec.swift
//  MaxibonKataIOS
//
//  Created by Antonio Calvo on 29/04/2017.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation
import XCTest
import SwiftCheck
@testable import MaxibonKataIOS

class KarumiHQsSpec: XCTestCase {
    
    func testAll() {
        property("Test fridge works properly") <- forAll { (developer: Developer) in
            print("\(developer.name) \(developer.numberOfMaxibonsToGet)")
            
            let karumiHQs = KarumiHQs()
            karumiHQs.openFridge(developer)
            return karumiHQs.maxibonLeft > 2
        }
    }

}
 
