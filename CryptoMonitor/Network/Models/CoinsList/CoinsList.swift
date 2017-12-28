//
//  CoinsList.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 15.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CoinsList {
    var response: String
    var message: String
    var baseImageUrl: String
    var baseLinkUrl: String
    var defaultWatchlist: [String: String] = [:]
    var data: [String: CoinInfo] = [:]
    var coinsList: [CoinInfo] = []
}

extension CoinsList {
    init(json: JSON){
        response = json[NetworkParamsKeys.CoinList.response.rawValue].stringValue
        message = json[NetworkParamsKeys.CoinList.message.rawValue].stringValue
        baseImageUrl = json[NetworkParamsKeys.CoinList.baseImageUrl.rawValue].stringValue
        baseLinkUrl = json[NetworkParamsKeys.CoinList.baseLinkUrl.rawValue].stringValue
        
        for (key, value) in json[NetworkParamsKeys.CoinList.defaultWatchlist.rawValue]{
            defaultWatchlist[key] = value.stringValue
        }
        
        // Parse coins info from data
        for (key, value) in json[NetworkParamsKeys.CoinList.data.rawValue] {
            data[key] = CoinInfo.init(coinInfo: value, baseImageUrl: baseImageUrl, baseLinkUrl: baseLinkUrl)
        }
        
        // Sort coins by name
        for (_, value) in data {
            coinsList.append(value)
        }
        
        coinsList = coinsList.sorted(by: {return $0.coinName < $1.coinName})

    }
}
