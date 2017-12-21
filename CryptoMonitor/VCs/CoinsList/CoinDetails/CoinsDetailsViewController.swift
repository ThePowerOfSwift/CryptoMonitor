//
//  CoindDetailsViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 20.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit

class CoinsDetailsViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var coin : CoinInfo? = nil
    
    func setCoin(coin: CoinInfo){
        self.coin = coin
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.someAction(_:)))
        self.label.addGestureRecognizer(gesture)
        self.label.text = coin!.coinName
        isNavigationBarTransparent = false
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let name = coin?.coinName{
            self.setVC_Title(name)
        }
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // or for Swift 3
    @objc func someAction(_ sender:UITapGestureRecognizer){
        self.navigationController?.popViewController(animated: true)
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
