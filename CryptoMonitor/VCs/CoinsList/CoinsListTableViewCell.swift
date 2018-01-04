//
//  CoinsListTableViewCell.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 15.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class CoinsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coinImage: UIImageView!
    
    @IBOutlet weak var coinName: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var request: Request?
    var coin: CoinInfo!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure(with coin: CoinInfo) {
        self.coin = coin
        reset()
        loadImage()
    }
    
    func reset() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        coinImage.image = nil
        request?.cancel()
        coinName.text = nil
    }
    
    func loadImage() {
        if let image = NetworkService().cachedImage(for: coin.baseImgUrl + coin.imgUrl) {
            updateCell(name: coin.coinName, image: image)
            return
        }
           downloadImage()
        }

    func downloadImage() {
        // TODO: Core Data Image Loading
        if NetworkReachability.isConnectedToNetwork() {
            let fullUrl = coin.baseImgUrl + coin.imgUrl
        request = NetworkService().downloadImage(for: fullUrl, completion: {image in
            self.updateCell(name: self.coin.coinName, image: image)
        })
        }
    }
    
    func updateCell(name: String, image: UIImage){
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.coinName.text = formatCoinName(name)
        self.coinImage.image = image
    }
    
    func formatCoinName(_ name: String)->String{
        if name.count > 15 {
            return name.replacingOccurrences(of: " ", with: "\n")
        } else {
            return name
        }
    }

}
