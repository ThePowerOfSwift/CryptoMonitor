//
//  NetworkParamsKeys.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 15.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import Foundation

enum NetworkParamsKeys: String {
    
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
