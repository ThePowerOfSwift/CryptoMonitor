//
//  Equipment.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 26.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Equipment{
    var response = "Response"
    var message = "Message"
    var type = "Type"
    var miningData = "MiningData"
    var coinData = "CoinData"
}

extension Equipment {
    init(json: JSON) {
        print("fuck")
    }
}
