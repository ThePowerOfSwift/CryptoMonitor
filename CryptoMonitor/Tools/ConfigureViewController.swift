//
//  ConfigureViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 21.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit

extension UIViewController {
    func configureBackBarButtonItem() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setVC_Title(_ title: String) {
        self.navigationItem.title = title
    }
    
    var isNavigationBarTransparent: Bool {
        get {
            return navigationController?.navigationBar.isTranslucent ?? false
        }
        set {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = newValue
            self.navigationController?.view.backgroundColor = .clear
            edgesForExtendedLayout = []
        }
    }
    
}
