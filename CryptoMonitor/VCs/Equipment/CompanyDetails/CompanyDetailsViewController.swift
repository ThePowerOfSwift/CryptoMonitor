//
//  CompanyDetailsViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 03.01.18.
//  Copyright © 2018 Serg Liamthev. All rights reserved.
//

import UIKit

class CompanyDetailsViewController: UIViewController {
    
    @IBOutlet weak var companyImage: UIImageView!
    
    @IBOutlet weak var coinImage: UIImageView!
    
    @IBOutlet weak var companyName: UILabel!
    
    @IBOutlet weak var isRecomended: UILabel!
    
    @IBOutlet weak var isSponsored: UILabel!
    
    @IBOutlet weak var companyAlgorithm: UILabel!
    
    @IBOutlet weak var powerConsumption: UILabel!
    
    @IBOutlet weak var costCurrencyLb: UILabel!
    
    @IBOutlet weak var equipmentType: UILabel!
    
    @IBOutlet weak var hashPerSec: UILabel!
    
    @IBOutlet weak var companyURL: UITextView!
    
    @IBOutlet weak var affiliateURL: UITextView!
    
    var data: MiningData? = nil
    
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
    
    func setData(_ data: MiningData){
        self.data = data
    }
    
    func updateUI(){
        guard let company = data else {
            return
        }
        self.title = company.company
        let baseURL = NetworkService.webBaseURL
        loadImage(URL: baseURL+company.logoUrl, to: companyImage)
        loadImage(URL: baseURL+company.currenciesAvailableLogo, to: coinImage)
        companyName.text = "Name: " + "\(company.name)"
        isRecomended.text = "Recomended: " + "\(BtS(company.recomended))"
        isSponsored.text = "Sponsored: " + "\(BtS(company.sponsored))"
        companyAlgorithm.text = "Algorithm: " + "\(company.algorithm)"
        powerConsumption.text = "PowerConsum.:\n" + "\(company.powerConsumption)" + " W"
        costCurrencyLb.text = "Cost: " + "\(company.cost)" + " " + "\(company.currency)"
        equipmentType.text = "EquipmentType: " + "\(company.equipmentType)"
        hashPerSec.text = "HashesPerSecond: " + "\(company.hashesPerSecond)"
        
        // create attributed string
        companyURL.text = "CompanyURL:\n" + "\(baseURL + company.url)"
        affiliateURL.text = "AffiliateURL:\n" + "\(company.affiliateURL)"
    }
    
    // MARK: Image loading method
    func loadImage(URL: String, to: UIImageView){
        if NetworkReachability.isConnectedToNetwork() {
            if let image = NetworkService().cachedImage(for: URL) {
                to.image = image
            } else {
                NetworkService().downloadImage(for: URL, completion: { image in
                    DispatchQueue.main.async {
                        to.image = image
                    }
                })
            }
        }
    }
    
    // MARK: Bool to string method
    func BtS(_ b: Bool) -> String {
        switch b {
        case true:
            return "YES"
        case false:
            return "NO"
        }
    }
    
    /*
     var id = "0"
     var parentId = "0"
     var company = "NoName"
     var url = ""
     var logoUrl = ""
     var name = "NoName"
     var recomended = false
     var sponsored = false
     var affiliateURL = ""
     var algorithm = ""
     var hashesPerSecond = "10"
     var cost = "0.05"
     var currency = ""
     var equipmentType = ""
     var powerConsumption = "5"
     var currenciesAvailable = ""
     var currenciesAvailableLogo = ""
     var currenciesAvailableName = ""
     */
}
