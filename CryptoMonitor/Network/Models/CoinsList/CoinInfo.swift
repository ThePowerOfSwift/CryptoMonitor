//
//  CoinInfo.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 15.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import Foundation
import SwiftyJSON

class CoinInfo {
    
    var id: Int = 0
    var url: String = ""
    var imgUrl: String = ""
    var name: String = ""
    var symbol: String = ""
    var coinName: String = ""
    var fullName: String = ""
    var algorithm: String = ""
    var proofType: String = ""
    var fullyPremined: Int = 0
    var totalCoinSupply: Int = 0
    var preMinedValue: String = ""
    var totalCoinsFreeFloat: String = ""
    var sortOrder: Int = 0
    var sponsored: Bool = true

    init(coinInfo: JSON) {
        id = coinInfo[NetworkParamsKeys.id.rawValue].intValue
        url = coinInfo[NetworkParamsKeys.url.rawValue].stringValue
        imgUrl = coinInfo[NetworkParamsKeys.imageUrl.rawValue].stringValue
        name = coinInfo[NetworkParamsKeys.name.rawValue].stringValue
        symbol = coinInfo[NetworkParamsKeys.symbol.rawValue].stringValue
        coinName = coinInfo[NetworkParamsKeys.coinName.rawValue].stringValue
        fullName = coinInfo[NetworkParamsKeys.fullName.rawValue].stringValue
        algorithm = coinInfo[NetworkParamsKeys.algorithm.rawValue].stringValue
        proofType = coinInfo[NetworkParamsKeys.proofType.rawValue].stringValue
        fullyPremined = coinInfo[NetworkParamsKeys.fullyPremined.rawValue].intValue
        totalCoinSupply = coinInfo[NetworkParamsKeys.totalCoinSupply.rawValue].intValue
        preMinedValue = coinInfo[NetworkParamsKeys.preMinedValue.rawValue].stringValue
        totalCoinsFreeFloat = coinInfo[NetworkParamsKeys.totalCoinsFreeFloat.rawValue].stringValue
        sortOrder = coinInfo[NetworkParamsKeys.sortOrder.rawValue].intValue
        sponsored = coinInfo[NetworkParamsKeys.sponsored.rawValue].boolValue
//        "365":{
//            "Id":"33639",
//            "Url":"/coins/365/overview",
//            "ImageUrl":"/media/352070/365.png",
//            "Name":"365",
//            "Symbol":"365",
//            "CoinName":"365Coin",
//            "FullName":"365Coin (365)",
//            "Algorithm":"X11",
//            "ProofType":"PoW/PoS",
//            "FullyPremined":"0",
//            "TotalCoinSupply":"2300000000",
//            "PreMinedValue":"N/A",
//            "TotalCoinsFreeFloat":"N/A",
//            "SortOrder":"916",
//            "Sponsored":false
//        }
    }
}
