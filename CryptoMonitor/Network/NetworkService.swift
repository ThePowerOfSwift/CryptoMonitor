//
//  NetworkService.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 13.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    
    static var url_list_coins = "api/data/coinlist/"
    
    static var url_equipment = "api/data/miningequipment/"
    
    var responseBody: String = ""
    
    private static var baseURL: String {
        return "https://www.cryptocompare.com/"       /* prod */
    }
    
    static func request(fullURL: String, completionHandler: @escaping (DataResponse<Any>) -> Void){
        if NetworkReachability.isConnectedToNetwork(){
            Alamofire.request(fullURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ dataResponse in
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
