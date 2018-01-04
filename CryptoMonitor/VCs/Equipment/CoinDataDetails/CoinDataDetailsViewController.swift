//
//  CoinDataDetailsViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 03.01.18.
//  Copyright © 2018 Serg Liamthev. All rights reserved.
//

import UIKit

class CoinDataDetailsViewController: UIViewController {

    var coinData: CoinData?
    
    @IBOutlet weak private var coinImage: UIImageView!
    
    @IBOutlet weak private var coinPrice: UILabel!
    
    @IBOutlet weak private var coinBlockReward: UILabel!
    
    @IBOutlet weak private var coinBlockTime: UILabel!
    
    @IBOutlet weak private var coinBlockNumber: UILabel!
    
    @IBOutlet weak private var coinDifficulty: UILabel!
    
    @IBOutlet weak private var coinBlockReduction: UILabel!
    
    @IBOutlet weak private var coinNetHash: UILabel!
    
    @IBOutlet weak private var coinTotalMined: UILabel!
    
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

    func setData(_ data: CoinData) {
        self.coinData = data
    }
    
    func updateUI() {
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
    
    func loadImage() {
        guard let imgUrl = coinData?.imageURL else {
            return
        }
        if let image = NetworkService().cachedImage(for: NetworkService.webBaseURL + imgUrl) {
            DispatchQueue.main.async {
                self.coinImage.image = image
            }
            return
        }
        downloadImage()
    }
    
    func downloadImage() {
        guard let imgUrl = coinData?.imageURL else {
            return
        }
        // TODO: Core Data Image Loading
        if NetworkReachability.isConnectedToNetwork() {
            NetworkService().downloadImage(for: NetworkService.webBaseURL + imgUrl, completion: {image in
                DispatchQueue.main.async {
                    self.coinImage.image = image
                }
            })
        }
    }
    
}
