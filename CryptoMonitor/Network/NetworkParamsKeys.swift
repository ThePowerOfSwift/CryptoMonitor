//
//  NetworkParamsKeys.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 15.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import Foundation

enum NetworkParamsKeys {

    enum CoinList: String {
        // https://min-api.cryptocompare.com/data/all/coinlist
        case response = "Response"
        case message = "Message"
        case baseImageUrl = "BaseImageUrl"
        case baseLinkUrl = "BaseLinkUrl"
        case defaultWatchlist = "DefaultWatchlist"
        case coinIs = "CoinIs"
        
        case data = "Data"
        // CoinInfo keys
        case id = "Id"
        case url = "Url"
        case imageUrl = "ImageUrl"
        case name = "Name"
        case symbol = "Symbol"
        case coinName = "CoinName"
        case fullName = "FullName"
        case algorithm = "Algorithm"
        case proofType = "ProofType"
        case fullyPremined = "FullyPremined"
        case totalCoinSupply = "TotalCoinSupply"
        case preMinedValue = "PreMinedValue"
        case totalCoinsFreeFloat = "TotalCoinsFreeFloat"
        case sortOrder = "SortOrder"
        case sponsored = "Sponsored"
    }
   
    enum Equipment: String {
        //https://www.cryptocompare.com/api/data/miningequipment/
        case response = "Response"
        case message = "Message"
        case type = "Type"
        case miningData = "MiningData"
        case coinData = "CoinData"
        // MiningData
        case id = "Id"
        case parentId = "ParentId"
        case company = "Company"
        case url = "Url"
        case logoUrl = "LogoUrl"
        case name = "Name"
        case recomended = "Recommended"
        case sponsored = "Sponsored"
        case affiliateURL = "AffiliateURL"
        case algorithm = "Algorithm"
        case hashesPerSecond = "HashesPerSecond"
        case cost = "Cost"
        case currency = "Currency"
        case equipmentType = "EquipmentType"
        case powerConsumption = "PowerConsumption"
        case currenciesAvailable = "CurrenciesAvailable"
        case currenciesAvailableLogo = "CurrenciesAvailableLogo"
        case currenciesAvailableName = "CurrenciesAvailableName"
        // CoinData
        case priceUSD = "PriceUSD"
        case symbol = "Symbol"
        case difficultyAdjustment = "DifficultyAdjustment"
        case blockRewardReduction = "BlockRewardReduction"
        case blockNumber = "BlockNumber"
        case blockTime = "BlockTime"
        case netHashesPerSecond = "NetHashesPerSecond"
        case totalCoinsMined = "TotalCoinsMined"
        case previousTotalCoinsMined = "PreviousTotalCoinsMined"
        case blockReward = "BlockReward"
    }
    
    enum TopPairs: String {
        case fsym
        case tsym
        case limit
    }
}
