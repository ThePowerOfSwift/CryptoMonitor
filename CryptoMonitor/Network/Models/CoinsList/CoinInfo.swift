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
    var baseImgUrl: String = ""
    var baseLink: String = ""
    // Base image and description URL

    init(coinInfo: JSON, baseImageUrl: String, baseLinkUrl: String) {
        id = coinInfo[NetworkParamsKeys.CoinList.id.rawValue].intValue
        url = coinInfo[NetworkParamsKeys.CoinList.url.rawValue].stringValue
        imgUrl = coinInfo[NetworkParamsKeys.CoinList.imageUrl.rawValue].stringValue
        name = coinInfo[NetworkParamsKeys.CoinList.name.rawValue].stringValue
        symbol = coinInfo[NetworkParamsKeys.CoinList.symbol.rawValue].stringValue
        coinName = coinInfo[NetworkParamsKeys.CoinList.coinName.rawValue].stringValue
        fullName = coinInfo[NetworkParamsKeys.CoinList.fullName.rawValue].stringValue
        algorithm = coinInfo[NetworkParamsKeys.CoinList.algorithm.rawValue].stringValue
        proofType = coinInfo[NetworkParamsKeys.CoinList.proofType.rawValue].stringValue
        fullyPremined = coinInfo[NetworkParamsKeys.CoinList.fullyPremined.rawValue].intValue
        totalCoinSupply = coinInfo[NetworkParamsKeys.CoinList.totalCoinSupply.rawValue].intValue
        preMinedValue = coinInfo[NetworkParamsKeys.CoinList.preMinedValue.rawValue].stringValue
        totalCoinsFreeFloat = coinInfo[NetworkParamsKeys.CoinList.totalCoinsFreeFloat.rawValue].stringValue
        sortOrder = coinInfo[NetworkParamsKeys.CoinList.sortOrder.rawValue].intValue
        sponsored = coinInfo[NetworkParamsKeys.CoinList.sponsored.rawValue].boolValue
        
        baseImgUrl = baseImageUrl
        baseLink = baseLinkUrl
    }
}
