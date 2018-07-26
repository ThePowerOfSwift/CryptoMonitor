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

class CoinsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak private var coinsTable: UITableView!
    
    @IBOutlet weak private var coinsSearchBar: UISearchBar!
    
    var sortedCoins: [CoinInfo] = []
    
    var searchCoins: [CoinInfo] = []
    
    var isSearch = false
    
    var coinsImages: [Data] = []
    
    let networkService = NetworkService()
    
    let cellName = "CoinsListTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccesibilityLabels()
        configCoinsTable()
        self.coinsSearchBar.delegate = self
        loadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        super.viewWillAppear(true)
        self.configureBackBarButtonItem()
        coinsTable.reloadData()
    }
    
    // MARK: Load data to table
    func loadData() {
        if NetworkReachability.isConnectedToNetwork() {
            self.navigationController?.topViewController?.destroyNoInternetView()
            if !sortedCoins.isEmpty {
                reloadCoinsTable()
            } else {
                loadCoinsList()
            }
        } else {
            self.navigationController?.topViewController?.showNoInternetView()
        }
    }
    
    // MARK: CoinTable delegate methods
    
    func configCoinsTable() {
        coinsTable.register(UINib(nibName: cellName,
                                  bundle: Bundle.main),
                            forCellReuseIdentifier: cellName)
        coinsTable.delegate = self
        coinsTable.dataSource = self
        //coinsTable.separatorStyle = .none
        coinsTable.estimatedRowHeight = 128
        coinsTable.rowHeight = 128
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellName) as? CoinsListTableViewCell else {
            fatalError("Unable to get cell")
        }
        if !isSearch {
            cell.configure(with: sortedCoins[indexPath.row])
            return cell
        } else {
            cell.configure(with: searchCoins[indexPath.row])
            return cell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !isSearch {
            return sortedCoins.count
        } else {
            return searchCoins.count
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coinsDetailsVC = CoinsDetailsViewController(nibName: "CoinsDetailsViewController", bundle: nil)
        if !isSearch {
            coinsDetailsVC.setCoin(coin: sortedCoins[indexPath.row])
        } else {
            coinsDetailsVC.setCoin(coin: searchCoins[indexPath.row])
        }
        self.navigationController?.pushViewController(coinsDetailsVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128.0
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128.0
    }
    func loadCoinsList() {
        if NetworkReachability.isConnectedToNetwork() {
            self.startActivityIndicator()
        }
        NetworkService.requestApi(endpoint: CoinsListEndpoint.getCoinsList(),
                                  completionHandler: {(dataResponse) -> Void in
            self.stopActivityIndicator()
            guard let value = dataResponse.value else {
                return
            }
            let coins = CoinsList(json: value )
            self.sortedCoins = coins.coinsList
            self.reloadCoinsTable()
        })
    }
    func reloadCoinsTable() {
        DispatchQueue.main.async {
            if self.isViewLoaded && (self.view.window != nil) {
                self.coinsTable.reloadData()
            }
        }
    }
    // MARK: Search bar delegates methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       //    Tells the delegate that the user changed the search text.
        self.search(searchBar)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.search(searchBar)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.search(searchBar)
    }
    // MARK: Search method implementation
    func search(_ searchBar: UISearchBar) {
        if let text = searchBar.text, text.isEmpty {
            self.isSearch = false
        }
        if let text = searchBar.text, !text.isEmpty {
            self.isSearch = true
            self.searchForCoins(searchString: text)
        }
        if searchCoins.isEmpty && self.isSearch == true {
            self.showNoResultView()
        }
        if !searchCoins.isEmpty || self.isSearch == false {
            self.hideNoResultView()
        }
        self.coinsTable.reloadData()
    }
    // MARK: search coins by input string
    func searchForCoins(searchString: String) {
        self.searchCoins.removeAll()
        for coin in sortedCoins {
            if coin.name.lowercased().range(of: searchString.lowercased()) != nil {
                searchCoins.append(coin)
            }
        }
        searchCoins.sort { return $0.name < $1.name }
    }
    // MARK: set testing labels
    func setAccesibilityLabels() {
        self.coinsTable.accessibilityIdentifier = "coinsTable"
        self.coinsSearchBar.accessibilityIdentifier = "coinsSearchBar"
    }
}
