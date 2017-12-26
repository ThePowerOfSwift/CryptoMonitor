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
    var priceUSD = "PriceUSD"
    var symbol = "Symbol"
    var difficultyAdjustment = "DifficultyAdjustment"
    var blockRewardReduction = "BlockRewardReduction"
    var blockNumber = "BlockNumber"
    var BlockTime = "BlockTime"
    var netHashesPerSecond = "NetHashesPerSecond"
    var totalCoinsMined = "TotalCoinsMined"
    var previousTotalCoinsMined = "PreviousTotalCoinsMined"
    var blockReward = "BlockReward"
}

extension CoinData {
    init(json: JSON) {
        print("fuck")
    }
}
