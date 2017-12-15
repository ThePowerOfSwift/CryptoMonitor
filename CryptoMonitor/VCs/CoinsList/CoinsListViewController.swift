//
//  CoinsListViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 13.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit

class CoinsListViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextView!
    
    let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.textField.text.removeAll()
        self.startActivityIndicator()
        NetworkService.request(endpoint: CoinsListEndpoint.getCoinsList(), completionHandler: {(dataResponse) -> Void in
            self.stopActivityIndicator()
            self.textField.text = dataResponse.result.debugDescription
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
