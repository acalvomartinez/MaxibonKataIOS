//
//  MockChat.swift
//  MaxibonKataIOS
//
//  Created by Antonio Calvo on 29/04/2017.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation
@testable import MaxibonKataIOS

class MockChat: Chat {
    var messageSent: String? = nil
    
    func sendMessage(_ message: String) {
        messageSent = message
    }
}
