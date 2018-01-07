//
//  TopPairsDetailsViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 05.01.18.
//  Copyright © 2018 Serg Liamthev. All rights reserved.
//

import UIKit

class TopPairsDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var coinData: CoinData?
    var topPairs: TopPairs?
    
    @IBOutlet weak private var pairsTable: UITableView!
    
    let cellName = "PairsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let sym = coinData?.symbol else {
          return
        }
        navigationItem.title = sym
        configurePairsTable()
        loadTopPairs()
    }
    
    func setData(coinData: CoinData) {
       self.coinData = coinData
    }
    
    func loadTopPairs() {
        if NetworkReachability.isConnectedToNetwork() {
            self.startActivityIndicator()
        }
        guard let sym = coinData?.symbol else {
            return
        }
        NetworkService.requestApi(endpoint: TopPairsEndpoint.getTopPairs(fsym: sym, tsym: nil, limit: 2000), completionHandler: {(dataResponse) -> Void in
            self.stopActivityIndicator()
            guard let value = dataResponse.value else {
                return
            }
            self.topPairs = TopPairs(json: value)
            DispatchQueue.main.async {
                self.updateUI()
            }
        })
    }
    
    func updateUI() {
        pairsTable.reloadData()
    }
    
    func configurePairsTable() {
        pairsTable.register(UINib(nibName: cellName,
                                  bundle: Bundle.main),
                            forCellReuseIdentifier: cellName)
        pairsTable.delegate = self
        pairsTable.dataSource = self
        //pairsTable.separatorStyle = .none
        pairsTable.estimatedRowHeight = 135
        pairsTable.rowHeight = 135
    }

    // MARK: Table View data source methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = topPairs?.data else {
            return 0
        }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = topPairs?.data else {
            return UITableViewCell()
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? PairsTableViewCell else {
            return UITableViewCell()
        }
        cell.setData(pairData: data[indexPath.row])
        cell.updateUI()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135.0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135.0
    }
    
}
