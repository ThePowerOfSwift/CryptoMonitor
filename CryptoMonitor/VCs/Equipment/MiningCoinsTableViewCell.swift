//
//  MiningCoinsTableViewCell.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 28.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit
import Alamofire

class MiningCoinsTableViewCell: UITableViewCell {

    @IBOutlet weak var coinImage: UIImageView!
    
    @IBOutlet weak var coinLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var request: Request?
    var coinData: CoinData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure(coinData: CoinData) {
        self.coinData = coinData
        reset()
        loadImage()
    }
    
    func reset() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        coinImage.image = nil
        request?.cancel()
        coinLabel.text = nil
    }
    
    func loadImage() {
        if let image = NetworkService().cachedImage(for: NetworkService.webBaseURL + (coinData?.imageURL)! ) {
            updateCell(name: (coinData?.symbol)!, image: image)
            return
        }
        downloadImage()
    }
    
    func downloadImage() {
        // TODO: Core Data Image Loading
        if NetworkReachability.isConnectedToNetwork() {
            request = NetworkService().downloadImage(for: NetworkService.webBaseURL + (coinData?.imageURL)!, completion: {image in
                self.updateCell(name: (self.coinData?.symbol)!, image: image)
            })
        }
    }
    
    func updateCell(name: String, image: UIImage){
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        coinImage.image = image
        coinLabel.text = name
    }
    
}
