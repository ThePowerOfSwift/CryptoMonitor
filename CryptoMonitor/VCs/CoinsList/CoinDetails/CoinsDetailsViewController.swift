//
//  CoindDetailsViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 20.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class CoinsDetailsViewController: UIViewController {
    
    @IBOutlet weak private var coinImage: UIImageView!
    
    @IBOutlet weak private var coinURL: UITextView!
    
    @IBOutlet weak private var fullNameLabel: UILabel!
    
    @IBOutlet weak private var symbolLabel: UILabel!
    
    @IBOutlet weak private var algorithmLabel: UILabel!
    
    @IBOutlet weak private var proofTypeLabel: UILabel!
    
    @IBOutlet weak private var fullyPreminedLabel: UILabel!
    
    @IBOutlet weak private var totalSupplyLabel: UILabel!
    
    @IBOutlet weak private var preMinedValueLabel: UILabel!
    
    @IBOutlet weak private var sponsoredLabel: UILabel!
    
    var coin: CoinInfo?
    
    func setCoin(coin: CoinInfo) {
        self.coin = coin
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScreen()
        // Do any additional setup after loading the view.
        isNavigationBarTransparent = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let name = coin?.coinName {
            self.setVC_Title(name)
        }
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateScreen() {
        guard let coin = self.coin else {
            return
        }
        
        if NetworkReachability.isConnectedToNetwork() {
            if let image = NetworkService().cachedImage(for: coin.baseImgUrl + coin.imgUrl) {
                coinImage.image = image
            } else {
                NetworkService().downloadImage(for: coin.baseImgUrl + coin.imgUrl, completion: { image in
                    self.coinImage.image = image
                })
            }
        }
        
        fullNameLabel.text = coin.fullName
        symbolLabel.text = "Symbol: "+coin.symbol
        algorithmLabel.text = "Algorithm: "+coin.algorithm
        proofTypeLabel.text = "Proof Type: "+coin.proofType
        fullyPreminedLabel.text = "Fully premined: "+String(coin.fullyPremined)
        totalSupplyLabel.text = "Total supply: "+String(coin.totalCoinSupply)
        preMinedValueLabel.text = "Pre-mined value: "+coin.preMinedValue
        sponsoredLabel.text = "Sponsored: "+convertBool(coin.sponsored)
        
        var attributedString = "Want read more about coin?\nCheck link below!"
        attributedString.append("\n" + coin.baseLink + coin.url)
        coinURL.text = attributedString
        
        }
    
    func convertBool(_ bool: Bool) -> String {
        switch bool {
        case true:
            return "Yes"
        case false:
            return "No"
        }
    }

}
