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
        property("Test fridge works properly for one developer") <- forAll { (developer: Developer) in
            let mockChat = MockChat()
            let karumiHQs = KarumiHQs(chat: mockChat)
            karumiHQs.openFridge(developer)
            return karumiHQs.maxibonLeft > 2
        }
        
        property("Test fridge works properly for a list of developer") <- forAll { (developers: Array<Developer>) in
            let mockChat = MockChat()
            let karumiHQs = KarumiHQs(chat: mockChat)
            karumiHQs.openFridge(developers)
            return karumiHQs.maxibonLeft > 2
        }
        
        property("If there are two or less maxibons after opening the fridge the developer sends a message to buy more")
            <- forAll(Developer.arbitraryHungry) { (developer: Developer) in
                let chat = MockChat()
                let karumiHQs = KarumiHQs(chat: chat)
                karumiHQs.openFridge(developer)
                let expectedResult = chat.messageSent == "Hi guys, I'm \(developer.name). We need more maxibons!"
                chat.messageSent = nil
                return expectedResult
        }
        
        property("If there are more than two maxibons after opening the fridge the developer does not send message")
            <- forAll(Developer.arbitraryNotSoHungry) { (developer: Developer) in
                let chat = MockChat()
                let karumiHQs = KarumiHQs(chat: chat)
                karumiHQs.openFridge(developer)
                let expectedResult = chat.messageSent == nil
                chat.messageSent = nil
                return expectedResult
        }
    }
    
    func testIfDeveloperGets6MaxibomsNumberMaxibonsIs4() {
        let karumiHQs = KarumiHQs()
        
        karumiHQs.openFridge(Developer(name: "x", numberOfMaxibonsToGet: 6))
        
        assert(karumiHQs.maxibonLeft == 4)
    }
    
    func testArbitrary() {
        property("KarumiHQs is created properlly") <- forAll(KarumiHQs.arbitrary, Developer.arbitraryNotSoHungry) { (karumiHQs: KarumiHQs, developer: Developer) in
            karumiHQs.openFridge(developer)
            return karumiHQs.maxibonLeft > 2
        }
    }

}
 
