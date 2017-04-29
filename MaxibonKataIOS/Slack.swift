//
//  slack.swift
//  MaxibonKataIOS
//
//  Created by Antonio Calvo on 29/04/2017.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation

protocol Chat {
    func sendMessage(_ message: String)
}

public final class Slack: Chat {
    func sendMessage(_ message: String) {
        print("> \(message)")
    }
}
