//
//  CoinData.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 26.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CoinData {
    var priceUSD = 0.0
    var symbol = ""
    var difficultyAdjustment = "NULL"
    var blockRewardReduction = "NULL"
    var blockNumber = 0
    var blockTime = 0
    var netHashesPerSecond = 0.0
    var totalCoinsMined = 0.0
    var previousTotalCoinsMined = 0.0
    var blockReward = 0.0
    var imageURL: String?
}

extension CoinData {
    init(json: JSON) {
        priceUSD = json[NetworkParamsKeys.Equipment.priceUSD.rawValue].doubleValue
        symbol = json[NetworkParamsKeys.Equipment.symbol.rawValue].stringValue
        let diff = json[NetworkParamsKeys.Equipment.difficultyAdjustment.rawValue].stringValue
        difficultyAdjustment = diff.isEmpty ? "NULL" : diff
        let reduct = json[NetworkParamsKeys.Equipment.blockRewardReduction.rawValue].stringValue
        blockRewardReduction = reduct.isEmpty ? "NULL" : reduct
        blockNumber = json[NetworkParamsKeys.Equipment.blockNumber.rawValue].intValue
        blockTime = json[NetworkParamsKeys.Equipment.blockTime.rawValue].intValue
        netHashesPerSecond = json[NetworkParamsKeys.Equipment.netHashesPerSecond.rawValue].doubleValue
        totalCoinsMined = json[NetworkParamsKeys.Equipment.totalCoinsMined.rawValue].doubleValue
        previousTotalCoinsMined = json[NetworkParamsKeys.Equipment.previousTotalCoinsMined.rawValue].doubleValue
        blockReward = json[NetworkParamsKeys.Equipment.blockReward.rawValue].doubleValue
    }
}
