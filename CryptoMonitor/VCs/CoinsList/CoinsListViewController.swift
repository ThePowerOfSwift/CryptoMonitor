//
//  CoinsListViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 13.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class CoinsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var coinsTable: UITableView!
    
    var sortedCoins : [CoinInfo] = []
    
    var coinsImages : [Data] = []
    
    let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCoinsTable()
        //loadCoinsList()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadCoinsList()
    }
 
    // MARK: CoinTable methods
    func configCoinsTable(){
        coinsTable.register(UINib(nibName: "CoinsListTableViewCell",
                                  bundle: Bundle.main),
                            forCellReuseIdentifier: "CoinsListTableViewCell")
        coinsTable.delegate = self
        coinsTable.dataSource = self
    }

    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinsListTableViewCell") as? CoinsListTableViewCell else {
          fatalError("Unable to get cell")
        }
        
        guard let coin = sortedCoins[indexPath.row] as? CoinInfo else {
            fatalError("Unable to gat coin name")
        }
        cell.configure(with: sortedCoins[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("cell count:\(sortedCoins.count)")
        return sortedCoins.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(sortedCoins.count)
    }
    
    func loadCoinsList(){
        self.textField.text.removeAll()
        self.startActivityIndicator()
        NetworkService.request(endpoint: CoinsListEndpoint.getCoinsList(), completionHandler: {(dataResponse) -> Void in
            self.stopActivityIndicator()
            let coins = CoinsList.init(json: dataResponse.value!)
            self.sortedCoins = coins.coinsList
            
            DispatchQueue.main.async {
                self.coinsTable.reloadData()
                 self.textField.text = dataResponse.result.debugDescription
            }
        })
    }
    
}
