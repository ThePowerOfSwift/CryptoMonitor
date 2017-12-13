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
    
    static func request(fullURL: String){
        if Reachability.isConnectedToNetwork(){
            Alamofire.request(fullURL, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseString { (response:DataResponse<String>) in
                
                switch(response.result) {
                case .success(_):
                    guard let data = response.result.value else {
                       return
                    }
                    print(response.result.value)
                case .failure(_):
                    print(response.result.error)
                }
            }
            
        } else{
            let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
        
    }
    
}
