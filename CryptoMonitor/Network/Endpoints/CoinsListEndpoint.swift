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
}

extension CoinsListEndpoint {
    
    var path: String{
        return "/data/all/coinlist"
    }
    
    var method: HTTPMethod{
        switch self {
        case .getCoinsList:
            return .get
        default:
            return .get
        }
        
    }
    
    var parameters: [String : Any]?{
        return ["": NSObject.self]
    }
}
