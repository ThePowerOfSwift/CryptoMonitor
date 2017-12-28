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
    var response = ""
    var message = ""
    var type = ""
    var miningData: [String: MiningData] = [:]
    var coinData: [String: CoinData] = [:]
}

extension Equipment {
    init(json: JSON) {
       response = json[NetworkParamsKeys.Equipment.response.rawValue].stringValue
        message = json[NetworkParamsKeys.Equipment.message.rawValue].stringValue
        type = json[NetworkParamsKeys.Equipment.type.rawValue].stringValue
        
        for (key, value) in json[NetworkParamsKeys.Equipment.miningData.rawValue]{
            miningData[key] = MiningData.init(json: value)
        }
        
        for(key, value) in json[NetworkParamsKeys.Equipment.coinData.rawValue]{
            coinData[key] = CoinData.init(json: value)
        }
    }
}
