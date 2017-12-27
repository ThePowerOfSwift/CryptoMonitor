//
//  CompaniesViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 26.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit

class CompaniesViewController: UIViewController {

    var miningData: [String: MiningData]? = nil
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setData(miningData: [String: MiningData]){
        self.miningData = miningData
    }
    
    func updateUI(){
        
    }
    
}
