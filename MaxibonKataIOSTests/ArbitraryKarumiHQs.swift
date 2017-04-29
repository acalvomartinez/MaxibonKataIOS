//
//  ArbitraryKarumiHQs.swift
//  MaxibonKataIOS
//
//  Created by Antonio Calvo on 29/04/2017.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation
import SwiftCheck
@testable import MaxibonKataIOS

extension KarumiHQs: Arbitrary {
    public static var arbitrary: Gen<KarumiHQs> {
        return Int.arbitrary.map {
            return KarumiHQs(maxibonLeft: $0)
        }
    }
}
