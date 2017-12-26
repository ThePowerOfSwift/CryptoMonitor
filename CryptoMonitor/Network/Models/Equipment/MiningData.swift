//
//  MiningData.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 26.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MiningData{
    var id = "Id"
    var parentId = "ParentId"
    var company = "Company"
    var url = "Url"
    var logoUrl = "LogoUrl"
    var name = "Name"
    var recomended = "Recommended"
    var sponsored = "Sponsored"
    var affiliateURL = "AffiliateURL"
    var algorithm = "Algorithm"
    var hashesPerSecond = "HashesPerSecond"
    var cost = "Cost"
    var currency = "Currency"
    var equipmentType = "EquipmentType"
    var powerConsumption = "PowerConsumption"
    var currenciesAvailable = "CurrenciesAvailable"
    var currenciesAvailableLogo = "CurrenciesAvailableLogo"
    var currenciesAvailableName = "CurrenciesAvailableName"
}

extension MiningData {
    init(json: JSON) {
        print("fuck")
    }
}
