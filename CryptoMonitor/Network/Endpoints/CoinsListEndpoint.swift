//
//  CoinsListEndpoint.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 15.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import Foundation
import Alamofire

enum CoinsListEndpoint: EndpointProtocol {
    case getCoinsList()
    case loadOverview(urlOverview: String)
    case loadCoinImage(urlImage: String)
}

extension CoinsListEndpoint {
    var path: String {
        switch self {
        case .getCoinsList:
            return "/data/all/coinlist"
        case .loadCoinImage(let url):
            return url
        case .loadOverview(let url):
            return url
        }
        
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCoinsList:
            return .get
        default:
            return .get
        }
        
    }
    
    var parameters: [String: Any]? {
        return ["": NSObject.self]
    }
}
