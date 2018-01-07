//
//  PairData.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 07.01.18.
//  Copyright © 2018 Serg Liamthev. All rights reserved.
//

import Foundation
import SwiftyJSON

struct PairData {
    var exchange: String
    var fromSymbol: String
    var toSymbol: String
    var volume24h: Double
    var volume24hTo: Double
}

extension PairData {
    init(json: JSON) {
        exchange = json[NetworkParamsKeys.TopPairs.exchange.rawValue].stringValue
        fromSymbol = json[NetworkParamsKeys.TopPairs.fromSymbol.rawValue].stringValue
        toSymbol = json[NetworkParamsKeys.TopPairs.toSymbol.rawValue].stringValue
        volume24h = json[NetworkParamsKeys.TopPairs.volume24h.rawValue].doubleValue
        volume24hTo = json[NetworkParamsKeys.TopPairs.volume24hTo.rawValue].doubleValue
    }
}
