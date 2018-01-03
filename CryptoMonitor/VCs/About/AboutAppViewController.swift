//
//  AboutAppViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 13.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit

class AboutAppViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
        // Do any additional setup after loading the view.
    }
    
    func setText(){
        var attributedString = "Powered by API:"
        attributedString.append("\n"+"https://www.cryptocompare.com/api#")
        attributedString.append("\n"+"Developed by SergLam.")
        attributedString.append("\n"+"Source code aviable on GitHub:")
        attributedString.append("\n"+"https://github.com/SergLam/CryptoMonitor")
        textView.text = attributedString
    }



}
