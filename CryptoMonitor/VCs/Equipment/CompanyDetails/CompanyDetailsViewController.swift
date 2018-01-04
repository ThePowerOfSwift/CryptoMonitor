//
//  CompanyDetailsViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 03.01.18.
//  Copyright © 2018 Serg Liamthev. All rights reserved.
//

import UIKit

class CompanyDetailsViewController: UIViewController {

    var company: MiningData? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = company!.company
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
        self.company = data
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
