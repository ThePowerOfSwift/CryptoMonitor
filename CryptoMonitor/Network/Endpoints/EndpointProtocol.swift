//
//  EndpointProtocol.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 15.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import Foundation
import Alamofire

protocol EndpointProtocol {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
}
