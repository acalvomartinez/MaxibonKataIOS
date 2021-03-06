//
//  KarumiHQs.swift
//  MaxibonKataIOS
//
//  Created by Antonio Calvo on 29/04/2017.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation

public final class KarumiHQs {
    
    fileprivate let chat: Chat
    var maxibonLeft: Int
    
    convenience init() {
        self.init(chat: Slack()) 
    }
    
    init(maxibonLeft: Int) {
        self.chat = Slack()
        self.maxibonLeft = maxibonLeft
    }
    
    init(chat: Chat, maxibonLeft: Int = 10) {
        self.chat = chat
        self.maxibonLeft = maxibonLeft
    }
    
    
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
                
                alertAboutMaxibons(developer)
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
    
    fileprivate func alertAboutMaxibons(_ developer: Developer) {
        chat.sendMessage("Hi guys, I'm \(developer.name). We need more maxibons!")
    }
}
