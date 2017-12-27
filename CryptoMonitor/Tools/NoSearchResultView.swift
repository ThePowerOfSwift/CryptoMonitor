//
//  NoSearchResultView.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 27.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var viewTag: Int { return 1000 }
    
    var keyboardHeight: CGFloat { return keyBoardWillShow(notification: NSNotification.init(name: .UIKeyboardWillShow, object: nil, userInfo: nil)) }
    
    func showNoResultView(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func hideNoResultView(){
        if let view = self.view.subviews.filter(
            { $0.tag == self.activityIndicatorTag}).first as? UIView {
            view.removeFromSuperview()
        }
    }
    
    @objc func keyBoardWillShow(notification: NSNotification) -> CGFloat{
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            return keyboardRectangle.height
        } else {
            return 0.0
        }
    }
    
    
    @objc func keyBoardWillHide(notification: NSNotification) {
        //handle dismiss of keyboard here
    }
    
}
