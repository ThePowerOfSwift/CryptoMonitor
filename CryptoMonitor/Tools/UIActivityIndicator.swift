//
//  UIActivityIndicator.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 14.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var activityIndicatorTag: Int { return 999999 }
    
    func startActivityIndicator(style: UIActivityIndicatorViewStyle = .gray,
                                location: CGPoint? = nil) {
        
        //Set the position - defaults to `center` if no`location`
        //argument is provided
//        self.view.center
        let loc = location ?? CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        
        //Ensure the UI is updated from the main thread
        //in case this method is called from a closure
        
        DispatchQueue.main.async {
            //Create the activity indicator
            UIApplication.shared.beginIgnoringInteractionEvents()
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: style)
            
            // Set custom size to indicator
//            activityIndicator.frame = CGRect(x: 0, y: 0, width: 450, height: 450)
            let transform: CGAffineTransform = CGAffineTransform(scaleX: 2.5, y: 2.5)
            activityIndicator.transform = transform
            activityIndicator.color = UIColor.black
            
            //Add the tag so we can find the view in order to remove it later
            activityIndicator.tag = self.activityIndicatorTag
            //Set the location
            
            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true
            //Start animating and add the view
            
            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
        }
    }
    
    func stopActivityIndicator() {
        //Again, we need to ensure the UI is updated from the main thread!
        DispatchQueue.main.async {
            //Here we find the `UIActivityIndicatorView` and remove it from the view
            UIApplication.shared.endIgnoringInteractionEvents()
            if let activityIndicator = self.view.subviews.filter({ $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
        
}
