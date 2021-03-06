//
//  MiningCoinsViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 26.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit

class MiningCoinsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var coinData: [CoinData] = []
    
    var miningData: [MiningData] = []
    
    @IBOutlet weak private var coinsTable: UITableView!
    
    let cellIdentifier = "MiningCoinsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCoinsTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.coinsTable.reloadData()
    }
    
    func configCoinsTable() {
        coinsTable.register(UINib(nibName: cellIdentifier,
                                  bundle: Bundle.main),
                            forCellReuseIdentifier: cellIdentifier)
        coinsTable.delegate = self
        coinsTable.dataSource = self
        coinsTable.estimatedRowHeight = 120
        coinsTable.rowHeight = 120
    }
    
    func setData(coinData: [CoinData], miningData: [MiningData]) {
        self.coinData = coinData
        self.miningData = miningData
        for (index, data) in coinData.enumerated() {
            for data1 in miningData where data.symbol == data1.currenciesAvailable {
                    self.coinData[index].imageURL = data1.currenciesAvailableLogo
                }
            }
    }
    
    // MARK: TableView delegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coinDataVC = CoinDataDetailsViewController()
        coinDataVC.setData(self.coinData[indexPath.row])
        self.navigationController?.pushViewController(coinDataVC, animated: true)
    }
    
    // MARK: TableView data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = coinsTable.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MiningCoinsTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(coinData: coinData[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
}
