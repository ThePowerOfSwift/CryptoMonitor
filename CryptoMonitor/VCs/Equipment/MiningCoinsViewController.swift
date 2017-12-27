//
//  MiningCoinsViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 26.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit

class MiningCoinsViewController: UIViewController {
    
    var coinData: [String: CoinData]?

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setData(coinData: [String: CoinData]){
        self.coinData = coinData
    }

    func updateUI(){
        if let data = coinData{
            var result = ""
            for(key, value) in data {
                result.append(key)
            }
            textView.text = result
        }
    }
}
