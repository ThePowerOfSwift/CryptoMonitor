//
//  TopPairsEndpoint.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 05.01.18.
//  Copyright © 2018 Serg Liamthev. All rights reserved.
//

import Foundation
import Alamofire

enum TopPairsEndpoint: EndpointProtocol {
    case getTopPairs(fsym: String, tsym: String?, limit: Int)
    case loadImage(imageUrl: String)
}

extension TopPairsEndpoint {
    var path: String {
        switch self {
        case .getTopPairs:
            return "/data/top/pairs"
        case .loadImage(let url):
            return NetworkService.webBaseURL + url
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getTopPairs:
            return .get
        default:
            return .get
        }
    }
    var parameters: [String: Any]? {
        var params: [NetworkParamsKeys.TopPairs: Any] = [:]

        switch self {
        case .getTopPairs(let fsym, let tsym, let limit):
            params[NetworkParamsKeys.TopPairs.fsym] = fsym
            params[NetworkParamsKeys.TopPairs.tsym] = tsym
            params[NetworkParamsKeys.TopPairs.limit] = limit
        default:
            return nil
        }

        return convertedParameterKeys(params)
    }

    private func convertedParameterKeys(_ params: [NetworkParamsKeys.TopPairs: Any]?) -> [String: Any]? {
        var resultParams: [String: Any]?
        if let params = params {
            resultParams = [:]
            params.forEach { resultParams?[$0.key.rawValue] = $0.value }
        }
        return resultParams
    }
}
