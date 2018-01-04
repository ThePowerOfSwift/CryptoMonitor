//
//  NoInternetNavigationController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 19.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var tag: Int { return 100 }
    
    func showNoInternetView() {
        let screenSize: CGRect = UIScreen.main.bounds
        let frame = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        frame.backgroundColor = UIColor.white
        frame.tag = tag
        
        let label = UILabel(frame: CGRect(x: 10, y: screenSize.height / 4, width: screenSize.width - 20, height: screenSize.height / 4))
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.numberOfLines = 3
        label.text = "No Internet connection. Check Network Connection and refresh page, please."
        frame.addSubview(label)
        
        let button = UIButton(type: .custom)
        
        button.frame = CGRect(x: (screenSize.width / 4), y: ((screenSize.height / 4) * 3), width: (screenSize.width / 2), height: 100)
        button.layer.cornerRadius = 0.25 * button.bounds.size.width
        button.setTitle("Fuck you", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.backgroundColor = UIColor(red: (107 / 255), green: (116 / 255), blue: (139 / 255), alpha: 1)
        button.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
        frame.addSubview(button)
        
        self.view.addSubview(frame)
    }
    
    func destroyNoInternetView() {
        if let view = self.view.viewWithTag(self.tag) {
            view.removeFromSuperview()
        }
    }
    
    @objc func thumbsUpButtonPressed() {
        print("thumbs up button pressed")
    }
    
}
