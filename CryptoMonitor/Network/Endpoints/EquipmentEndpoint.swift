//
//  EquipmentEndpoint.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 27.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import Foundation
import Alamofire

enum EquipmentEndpoint: EndpointProtocol {
    case getEquipment()
    case loadImage(imageUrl: String)
}

extension EquipmentEndpoint {
    var path: String {
        switch self {
        case .getEquipment:
            return "/api/data/miningequipment/"
        case .loadImage(let url):
            return NetworkService.webBaseURL + url
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getEquipment:
            return .get
        default:
            return .get
        }
    }
    var parameters: [String: Any]? {
        return ["": NSObject.self]
    }
}
