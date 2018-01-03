//
//  CoinDataDetailsViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 03.01.18.
//  Copyright © 2018 Serg Liamthev. All rights reserved.
//

import UIKit

class CoinDataDetailsViewController: UIViewController {

    var coinData: CoinData? = nil
    
    @IBOutlet weak var coinImage: UIImageView!
    
    @IBOutlet weak var coinPrice: UILabel!
    
    @IBOutlet weak var coinBlockReward: UILabel!
    
    @IBOutlet weak var coinBlockTime: UILabel!
    
    @IBOutlet weak var coinBlockNumber: UILabel!
    
    @IBOutlet weak var coinDifficulty: UILabel!
    
    @IBOutlet weak var coinBlockReduction: UILabel!
    
    @IBOutlet weak var coinNetHash: UILabel!
    
    @IBOutlet weak var coinTotalMined: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    func setData(_ data: CoinData){
        self.coinData = data
    }
    
    func updateUI(){
        guard let coinData = coinData else {
            return
        }
        self.title = coinData.symbol
        loadImage()
        coinPrice.text = "Price:" + " \(coinData.priceUSD)" + " $"
        coinBlockReward.text = "BlockReward:" + " \(coinData.blockReward)"
        
        coinBlockTime.text = "BlockTime:" + " \(coinData.blockTime)"
        
        coinBlockNumber.text = "BlockNumber:" + "\n" + "\(coinData.blockNumber)"
        
        coinDifficulty.text = "DifficultyAdjustment:" + "\n" + "\(coinData.difficultyAdjustment)"
        coinBlockReduction.text = "BlockRewardReduction:" + "\n" + "\(coinData.blockRewardReduction)"
        coinNetHash.text = "NetHashesPerSecond:" + "\n" + "\(coinData.netHashesPerSecond)"
        coinTotalMined.text = "TotalCoinsMined:" + "\n" + "\(coinData.totalCoinsMined)"
    }
    
    func ps(_ obj: Any) -> String{
        if obj != nil{
            return String(describing: obj)
        } else {
            return "null"
        }
        
    }
    
    func loadImage() {
        if let image = NetworkService().cachedImage(for: NetworkService.webBaseURL + (coinData?.imageURL)! ) {
            DispatchQueue.main.async {
                self.coinImage.image = image
            }
            return
        }
        downloadImage()
    }
    
    func downloadImage() {
        // TODO: Core Data Image Loading
        if NetworkReachability.isConnectedToNetwork() {
            NetworkService().downloadImage(for: NetworkService.webBaseURL + (coinData?.imageURL)!, completion: {image in
                DispatchQueue.main.async {
                    self.coinImage.image = image
                }
            })
        }
    }
    
}
