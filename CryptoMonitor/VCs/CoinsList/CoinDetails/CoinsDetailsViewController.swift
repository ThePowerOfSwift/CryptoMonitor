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

class CoinsDetailsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var coinImage: UIImageView!
    
    @IBOutlet weak var coinFullName: UILabel!
    
    @IBOutlet weak var coinAlgorithm: UILabel!
    
    @IBOutlet weak var coinProofType: UILabel!
    
    @IBOutlet weak var coinSupply: UILabel!
    
    @IBOutlet weak var coinURL: UITextView!
    
    var coin : CoinInfo? = nil
    
    func setCoin(coin: CoinInfo){
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
        if let name = coin?.coinName{
            self.setVC_Title(name)
        }
        self.navigationController?.isNavigationBarHidden = false
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
       // self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateScreen(){
        guard let coin = self.coin else {
            return
        }
        
        if NetworkReachability.isConnectedToNetwork() {
            if let image = NetworkService().cachedImage(for: coin.baseImgUrl + coin.imgUrl) {
                self.coinImage.image = image
            } else {
                NetworkService().downloadImage(for: coin.baseImgUrl + coin.imgUrl, completion: { image in
                    self.coinImage.image = image
                })
            }
        }
        
        self.coinFullName.text = coin.fullName
        self.coinAlgorithm.text = coin.algorithm
        self.coinProofType.text = coin.proofType
        self.coinSupply.text = String(coin.totalCoinSupply)
        
        var attributedString = "Want read more about coin? Check link below!"
        attributedString.append("\n"+coin.baseLink+coin.url)
        self.coinURL.text = attributedString
        
        }
    
    // MARk: TextField delegate methods
    
    
    // CoinInfo
    var id: Int = 0
    var url: String = ""
    var imgUrl: String = ""
    var name: String = ""
    var symbol: String = ""
    var coinName: String = ""
    var fullName: String = ""
    var algorithm: String = ""
    var proofType: String = ""
    var fullyPremined: Int = 0
    var totalCoinSupply: Int = 0
    var preMinedValue: String = ""
    var totalCoinsFreeFloat: String = ""
    var sortOrder: Int = 0
    var sponsored: Bool = true
    var baseImgUrl: String = ""
    var baseLink: String = ""
    // Base image and description URL
    
    

}
