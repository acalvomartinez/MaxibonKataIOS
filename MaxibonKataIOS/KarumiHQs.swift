//
//  KarumiHQs.swift
//  MaxibonKataIOS
//
//  Created by Antonio Calvo on 29/04/2017.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation

public final class KarumiHQs {
    
    var maxibonLeft = 10
    fileprivate var shouldBuyMoreMaxibons: Bool {
        return maxibonLeft <= 2
    }
    
    func openFridge(_ developer: Developer) {
        openFridge([developer])
    }
    
    func openFridge(_ developers:[Developer]) {
        developers.forEach { (developer) in
            grabMaxibons(developer)
            
            if shouldBuyMoreMaxibons {
                buyMaxibons()
            }
        }
    }

    fileprivate func grabMaxibons(_ developer: Developer) {
        maxibonLeft = maxibonLeft - developer.numberOfMaxibonsToGet
        if (maxibonLeft < 0) {
            maxibonLeft = 0
        }
    }
    fileprivate func buyMaxibons() {
        maxibonLeft = maxibonLeft + 10
    }
}
