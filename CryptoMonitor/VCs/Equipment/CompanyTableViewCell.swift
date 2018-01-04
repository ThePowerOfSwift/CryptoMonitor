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

    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak private var companyLogo: UIImageView!
    
    @IBOutlet weak private var companyName: UILabel!
    
    var miningData: MiningData?
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
        guard let data = miningData else {
            return
        }
        if let image = NetworkService().cachedImage(for: NetworkService.webBaseURL + data.logoUrl) {
            updateCell(name: data.company, image: image)
            return
        }
        downloadImage()
    }
    
    func downloadImage() {
        guard let data = miningData else {
            return
        }
        if NetworkReachability.isConnectedToNetwork() {
            request = NetworkService().downloadImage(for: NetworkService.webBaseURL + data.logoUrl, completion: { image in
                self.updateCell(name: data.company, image: image)
            })
        }
    }
    
    func updateCell(name: String, image: UIImage) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        companyName.text = name
        companyLogo.image = image
    }
    
}
