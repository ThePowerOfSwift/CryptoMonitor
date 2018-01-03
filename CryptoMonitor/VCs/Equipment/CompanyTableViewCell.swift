//
//  CompanyTableViewCell.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 03.01.18.
//  Copyright © 2018 Serg Liamthev. All rights reserved.
//

import UIKit
import Alamofire

class CompanyTableViewCell: UITableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var companyLogo: UIImageView!
    
    @IBOutlet weak var companyName: UILabel!
    
    var miningData : MiningData? = nil
    var request: Request?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(_ data: MiningData) {
        self.miningData = data
        reset()
        loadImage()
    }
    
    func reset() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        companyLogo.image = nil
        request?.cancel()
        companyName.text = nil
    }
    
    func loadImage() {
        if let image = NetworkService().cachedImage(for: NetworkService.webBaseURL + miningData!.logoUrl) {
            updateCell(name: miningData!.company, image: image)
            return
        }
        downloadImage()
    }
    
    func downloadImage() {
        // TODO: Core Data Image Loading
        if NetworkReachability.isConnectedToNetwork() {
            request = NetworkService().downloadImage(for: NetworkService.webBaseURL + miningData!.logoUrl, completion: {image in
                self.updateCell(name: self.miningData!.company, image: image)
            })
        }
    }
    
    func updateCell(name: String, image: UIImage){
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        companyName.text = name
        companyLogo.image = image
    }
    
}
