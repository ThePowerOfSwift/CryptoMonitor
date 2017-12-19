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
        
        let label = UILabel(frame: CGRect(x: 10, y: screenSize.height/4, width: screenSize.width-20, height: screenSize.height/2))
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.numberOfLines = 3
        label.text = "No Internet connection. Check Network Connection and refresh page, please."
        frame.addSubview(label)
        
        self.view.addSubview(frame)
    }
    
    func destroyNoInternetView() {
        if let view = self.view.viewWithTag(self.tag) {
            view.removeFromSuperview()
        }
    }
    
    
}
