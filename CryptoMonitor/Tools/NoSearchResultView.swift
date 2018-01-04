//
//  NoSearchResultView.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 27.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit
import SnapKit

extension UIViewController {
    
    var viewTag: Int { return 1000 }
    
    func showNoResultView() {
        // Hide previous view
        self.hideNoResultView()
        // Find search bar
        var searchBar: UISearchBar?
        for subview in self.view.subviews where subview is UISearchBar {
                searchBar = subview as? UISearchBar
            }
        guard let bar = searchBar else {
            return
        }
        
        // Create view under search bar
        let noResView = UIView(frame: CGRect(x: 0, y: bar.frame.height, width: self.view.frame.width, height: self.view.frame.height - bar.frame.height ))
        noResView.backgroundColor = UIColor(red: 45 / 255, green: 86 / 255, blue: 142 / 255, alpha: 1)
        noResView.tag = viewTag
        
        let label = UILabel(frame: CGRect(x: 10, y: bar.frame.height + 30, width: self.view.frame.width - 20, height: 30))
        label.text = "Nothing not found by your request"
        label.textAlignment = .center
        label.textColor = UIColor.white
        
        // Config noSearchResult view constraints
        self.view.addSubview(noResView)
        noResView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(bar).offset(bar.frame.height)
            make.left.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
        }
        
        // Config label constraints
        noResView.addSubview(label)
        label.snp.makeConstraints { (make) -> Void in
            make.top.left.right.equalTo(noResView).inset(UIEdgeInsets(top: 30, left: 10, bottom: 0, right: 10))
        }
    
    }
    
    func hideNoResultView() {
        let views = self.view.subviews.filter({ $0.tag == self.viewTag})
            for view in views {
                view.removeFromSuperview()
            }
    }
    
}
