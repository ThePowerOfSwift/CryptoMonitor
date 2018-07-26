//
//  TopPairsViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 12.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit

class TopPairsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var equipment: Equipment?
    
    @IBOutlet weak private var coinsTable: UITableView!
    
    let cellIdentifier = "MiningCoinsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Select coin"
        configureCoinsTable()
        self.configureBackBarButtonItem()
        loadData()
    }
    
    func configureCoinsTable() {
        coinsTable.register(UINib(nibName: cellIdentifier,
                                  bundle: Bundle.main),
                            forCellReuseIdentifier: cellIdentifier)
        coinsTable.delegate = self
        coinsTable.dataSource = self
        coinsTable.estimatedRowHeight = 120
        coinsTable.rowHeight = 120
    }
    
    func loadData() {
        if equipment == nil {
            if NetworkReachability.isConnectedToNetwork() {
                self.startActivityIndicator()
                NetworkService.requestWeb(endpoint: EquipmentEndpoint.getEquipment(),
                                          completionHandler: { (dataResponse) -> Void in
                    guard let value = dataResponse.result.value else {
                        return
                    }
                    self.equipment = Equipment(json: value)
                    // Set coin image URL
                    guard let equip = self.equipment else {
                        return
                    }
                    for (index, data) in equip.coinData.enumerated() {
                        for data1 in equip.miningData where data.symbol == data1.currenciesAvailable {
                            self.equipment?.coinData[index].imageURL = data1.currenciesAvailableLogo
                        }
                    }
                    //
                    self.stopActivityIndicator()
                    DispatchQueue.main.async {
                        self.coinsTable.reloadData()
                    }
                })
            } else {
                self.navigationController?.topViewController?.showNoInternetView()
            }
        }
    }
    
    // MARK: TableView Delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let topPairsVC = TopPairsDetailsViewController()
        guard let equip = self.equipment else {
            return
        }
        topPairsVC.setData(coinData: equip.coinData[indexPath.row])
        navigationController?.pushViewController(topPairsVC, animated: true)
    }
    // MARK: TableView Data Source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let equip = equipment else {
            return 0
        }
        return equip.coinData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard var equip = equipment else {
            return UITableViewCell()
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? MiningCoinsTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.configure(coinData: equip.coinData[indexPath.row])
        return cell
    }
}
