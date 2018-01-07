//
//  PairsTableViewCell.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 07.01.18.
//  Copyright © 2018 Serg Liamthev. All rights reserved.
//

import UIKit

class PairsTableViewCell: UITableViewCell {

    var pairData: PairData?
    
    @IBOutlet weak private var currencyImage: UIImageView!
    
    @IBOutlet weak private var coinAmount: UILabel!
    
    @IBOutlet weak private var moneyAmount: UILabel!
    
    @IBOutlet weak private var coinCourse: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateUI() {
        guard let data = pairData else {
            return
        }
        currencyImage.image = getImage(data.toSymbol)
        coinAmount.text = data.fromSymbol + " amount:\n" + "\(String(format: "%.2f", data.volume24h))"
        moneyAmount.text = data.toSymbol + " amount:\n" + "\(String(format: "%.2f", data.volume24hTo))"
        coinCourse.text = "Course:\n" + String(format: "%.4f", data.volume24hTo / data.volume24h) + " \(data.toSymbol)"
    }
    
    func setData(pairData: PairData) {
        self.pairData = pairData
    }
    
    func getImage(_ imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName) else {
            return UIImage(named: "no_img")!
        }
        return image
    }
    
}
