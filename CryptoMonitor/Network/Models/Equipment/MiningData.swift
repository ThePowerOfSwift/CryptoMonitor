//
//  MiningData.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 26.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MiningData {
    var id = "0"
    var parentId = "0"
    var company = "NoName"
    var url = ""
    var logoUrl = ""
    var name = "NoName"
    var recomended = false
    var sponsored = false
    var affiliateURL = ""
    var algorithm = ""
    var hashesPerSecond = "10"
    var cost = "0.05"
    var currency = ""
    var equipmentType = ""
    var powerConsumption = "5"
    var currenciesAvailable = ""
    var currenciesAvailableLogo = ""
    var currenciesAvailableName = ""
}

extension MiningData {
    init(json: JSON) {
        id = json[NetworkParamsKeys.Equipment.id.rawValue].stringValue
        parentId = json[NetworkParamsKeys.Equipment.parentId.rawValue].stringValue
        company = json[NetworkParamsKeys.Equipment.company.rawValue].stringValue
        url = json[NetworkParamsKeys.Equipment.url.rawValue].stringValue
        logoUrl = json[NetworkParamsKeys.Equipment.logoUrl.rawValue].stringValue
        name = json[NetworkParamsKeys.Equipment.name.rawValue].stringValue
        recomended = json[NetworkParamsKeys.Equipment.recomended.rawValue].boolValue
        sponsored = json[NetworkParamsKeys.Equipment.sponsored.rawValue].boolValue
        affiliateURL = json[NetworkParamsKeys.Equipment.affiliateURL.rawValue].stringValue
        algorithm = json[NetworkParamsKeys.Equipment.algorithm.rawValue].stringValue
        hashesPerSecond = json[NetworkParamsKeys.Equipment.hashesPerSecond.rawValue].stringValue
        cost = json[NetworkParamsKeys.Equipment.cost.rawValue].stringValue
        currency = json[NetworkParamsKeys.Equipment.currency.rawValue].stringValue
        equipmentType = json[NetworkParamsKeys.Equipment.equipmentType.rawValue].stringValue
        powerConsumption = json[NetworkParamsKeys.Equipment.powerConsumption.rawValue].stringValue
        currenciesAvailable = json[NetworkParamsKeys.Equipment.currenciesAvailable.rawValue].stringValue
        currenciesAvailableLogo = json[NetworkParamsKeys.Equipment.currenciesAvailableLogo.rawValue].stringValue
        currenciesAvailableName = json[NetworkParamsKeys.Equipment.currenciesAvailableName.rawValue].stringValue
    }
}
