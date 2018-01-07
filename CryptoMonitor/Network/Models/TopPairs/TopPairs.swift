//
//  TopPairs.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 07.01.18.
//  Copyright © 2018 Serg Liamthev. All rights reserved.
//

import Foundation
import SwiftyJSON

struct TopPairs {
    var response: String = ""
    var data: [PairData] = []
}
extension TopPairs {
    init(json: JSON) {
       response = json[NetworkParamsKeys.TopPairs.response.rawValue].stringValue
        for (_, value) in json[NetworkParamsKeys.TopPairs.data.rawValue] {
            data.append(PairData(json: value))
        }
       
    }
}
