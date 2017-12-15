//
//  NetworkService.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 13.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import Foundation
import Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON

class NetworkService {
    
    //https://min-api.cryptocompare.com/data/all/coinlist
    
    private static var baseURL: String {
        return "https://min-api.cryptocompare.com"       /* prod */
    }
    
    static func request(endpoint: EndpointProtocol, completionHandler: @escaping (DataResponse<JSON>) -> Void){
        if NetworkReachability.isConnectedToNetwork(){
            Alamofire.request(baseURL+endpoint.path, method: endpoint.method, parameters: endpoint.parameters, encoding: URLEncoding.default, headers: nil).responseSwiftyJSON{ dataResponse in
            DispatchQueue.main.async {
                completionHandler(dataResponse)
            }
        }
        } else{
            let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
        
    }
    
}
