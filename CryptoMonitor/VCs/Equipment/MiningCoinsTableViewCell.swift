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

    @IBOutlet weak private var coinImage: UIImageView!
    
    @IBOutlet weak private var coinLabel: UILabel!
    
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
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
        guard let imgUrl = coinData?.imageURL else {
            return
        }
        guard let symbol = coinData?.symbol else {
            return
        }
        if let image = NetworkService().cachedImage(for: NetworkService.webBaseURL + imgUrl ) {
            updateCell(name: symbol, image: image)
            return
        }
        downloadImage()
    }
    
    func downloadImage() {
        guard let imgUrl = coinData?.imageURL else {
            return
        }
        guard let symbol = coinData?.symbol else {
            return
        }
        coinLabel.text = symbol
        if NetworkReachability.isConnectedToNetwork() {
            request = NetworkService().downloadImage(for: NetworkService.webBaseURL + imgUrl, completion: {image in
                self.updateCell(name: symbol, image: image)
            })
        }
    }
    
    func updateCell(name: String, image: UIImage) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        coinImage.image = image
        coinLabel.text = name
    }
    
}
