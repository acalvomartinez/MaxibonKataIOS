//
//  DeveloperSpec.swift
//  MaxibonKataIOS
//
//  Created by Antonio Calvo on 29/04/2017.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation
import XCTest
import SwiftCheck
@testable import MaxibonKataIOS

class DeveloperSpec: XCTestCase {

    func testAll() {
        property("number of maxibons to consume can not be negative") <- forAll { (numberOfMaxibons: Int) in
            print("number maxiboms to test: \(numberOfMaxibons)")
            let developer = Developer(name: "AnyName", numberOfMaxibonsToGet: numberOfMaxibons)
            return developer.numberOfMaxibonsToGet >= 0
        }
        
        property("developer is created properlly") <- forAll { (name: String, numberOfMaxibons: Int) in
            print("\(name) \(numberOfMaxibons)")
            let developer = Developer(name: name, numberOfMaxibonsToGet: numberOfMaxibons)
            return developer.name == name && (developer.numberOfMaxibonsToGet == numberOfMaxibons || developer.numberOfMaxibonsToGet == 0)
        }
    }


}
