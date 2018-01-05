//
//  TopPairsDetailsViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 05.01.18.
//  Copyright © 2018 Serg Liamthev. All rights reserved.
//

import UIKit

class TopPairsDetailsViewController: UIViewController {

    @IBOutlet weak private var debugTextView: UITextView!
    
    var coinData: CoinData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = coinData!.symbol
        loadTopPairs()
    }
    
    func setData(coinData: CoinData) {
       self.coinData = coinData
    }
    
    func loadTopPairs() {
        if NetworkReachability.isConnectedToNetwork() {
            self.startActivityIndicator()
        }
        NetworkService.requestApi(endpoint: TopPairsEndpoint.getTopPairs(fsym: coinData!.symbol, tsym: nil, limit: 2000), completionHandler: {(dataResponse) -> Void in
            self.stopActivityIndicator()
            guard let value = dataResponse.value else {
                return
            }
            DispatchQueue.main.async {
                self.debugTextView.text = value.description
            }
        })
    }
    
    

}
