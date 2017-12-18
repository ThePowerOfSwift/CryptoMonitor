//
//  CoinsListTableViewCell.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 15.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit
import Alamofire

class CoinsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coinImage: UIImageView!
    
    @IBOutlet weak var coinName: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var request: Request?
    var coin: CoinInfo!
//    var CoreDataManager = CoreDataManager.instance()
    
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
        if let image = NetworkService().cachedImage(for: NetworkService.baseURL + coin.imgUrl) {
            updateCell(name: coin.coinName, image: image)
//            updateCell(name: coin.coinName, image: UIImage(data: coin.coinImage!,scale:1.0)! )
            return
        }
        downloadImage()
    }
    
    func downloadImage() {
        // TODO: Core Data Image Loading
        request = NetworkService().downloadImage(for: "https://www.cryptocompare.com"+coin.imgUrl, completion: {image in
            self.updateCell(name: self.coin.coinName, image: image)
        })
    }
    
    func updateCell(name: String, image: UIImage){
        //self.coinImage.imageFromUrl(urlString: NetworkService.baseURL+img_url)
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.coinName.text = name
        self.coinImage.image = image
    }
    
}
