//
//  Developer.swift
//  MaxibonKataIOS
//
//  Created by Antonio Calvo on 29/04/2017.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation

public struct Developer {
    let name: String
    let numberOfMaxibonsToGet: Int
    
    init(name: String, numberOfMaxibonsToGet: Int) {
        self.name = name
        self.numberOfMaxibonsToGet = numberOfMaxibonsToGet < 0 ? 0 : numberOfMaxibonsToGet
    }
}

open class Developers {
    open static let Pedro = Developer(name: "Pedro", numberOfMaxibonsToGet: 3)
    open static let Jorge = Developer(name: "Jorge", numberOfMaxibonsToGet: 2)
    open static let Fran = Developer(name: "Fran", numberOfMaxibonsToGet: 3)
    open static let Davide = Developer(name: "Davide", numberOfMaxibonsToGet: 3)
    open static let Sergio = Developer(name: "Sergio", numberOfMaxibonsToGet: 3)
}
