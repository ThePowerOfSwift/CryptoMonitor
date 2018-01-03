//
//  MiningCoinsViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 26.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit

class MiningCoinsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var coinData: [String: CoinData] = [:]{
        didSet{
            coinDataKeys = Array(coinData.keys)
        }
    }
    var coinDataKeys: [String] = []
    
    var miningData: [String: MiningData] = [:]
    
    @IBOutlet weak var coinsTable: UITableView!
    
    let cellIdentifier = "MiningCoinsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCoinsTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.coinsTable.reloadData()
    }
    
    func configCoinsTable(){
        coinsTable.register(UINib(nibName: cellIdentifier,
                                  bundle: Bundle.main),
                            forCellReuseIdentifier: cellIdentifier)
        coinsTable.delegate = self
        coinsTable.dataSource = self
        coinsTable.estimatedRowHeight = 120
        coinsTable.rowHeight = 120
    }
    
    func setData(coinData: [String: CoinData], miningData: [String: MiningData]){
        self.coinData = coinData
        self.miningData = miningData
        for(key, value) in coinData{
            for(key1, value1) in miningData{
                if value.symbol == value1.currenciesAvailable {
                    self.coinData[key]?.imageURL = value1.currenciesAvailableLogo
                }
            }
        }
    }
    
    // MARK: TableView delegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coinDataVC = CoinDataDetailsViewController()
        coinDataVC.setData(self.coinData[coinDataKeys[indexPath.row]]!)
        self.navigationController?.pushViewController(coinDataVC, animated: true)
    }
    
    // MARK: TableView data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinData.capacity
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = coinsTable.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MiningCoinsTableViewCell
        cell.configure(coinData: coinData[coinDataKeys[indexPath.row]]!)
        cell.selectionStyle = .none
        return cell
    }
    
}
