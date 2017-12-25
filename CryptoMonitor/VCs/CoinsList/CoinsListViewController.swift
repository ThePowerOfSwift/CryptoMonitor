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
    
    @IBOutlet weak var coinsTable: UITableView!
    
    @IBOutlet weak var coinsSearchBar: UISearchBar!
    
    var sortedCoins : [CoinInfo] = []
    
    var searchCoins : [CoinInfo] = []
    
    var isSearch = false
    
    var coinsImages : [Data] = []
    
    let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCoinsTable()
        self.coinsSearchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        self.configureBackBarButtonItem()
        if NetworkReachability.isConnectedToNetwork(){
            self.navigationController?.topViewController?.destroyNoInternetView()
            if sortedCoins.count > 0 {
                reloadCoinsTable()
            } else {
                loadCoinsList()
            }
        } else {
            self.navigationController?.topViewController?.showNoInternetView()
        }
        
    }
    
    // MARK: CoinTable delegate methods
    
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
        if !isSearch {
            guard let coin = sortedCoins[indexPath.row] as? CoinInfo else {
                fatalError("Unable to gat coin name")
            }
            cell.configure(with: sortedCoins[indexPath.row])
            
            return cell
        } else {
            guard let coin = searchCoins[indexPath.row] as? CoinInfo else {
                fatalError("Unable to gat coin name")
            }
            cell.configure(with: searchCoins[indexPath.row])
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !isSearch{
            return sortedCoins.count
        } else {
            return searchCoins.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: забыл привязать XIB
        // сделать метод ЮИ контролеле в котором сетить монету
        // и потом передавать его навигейшн контролеру
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
    
    func loadCoinsList(){
        if NetworkReachability.isConnectedToNetwork(){
            self.startActivityIndicator()
        }
        NetworkService.request(endpoint: CoinsListEndpoint.getCoinsList(), completionHandler: {(dataResponse) -> Void in
            self.stopActivityIndicator()
            let coins = CoinsList.init(json: dataResponse.value!)
            self.sortedCoins = coins.coinsList
            self.reloadCoinsTable()
        })
    }
    
    func reloadCoinsTable(){
        DispatchQueue.main.async {
            if self.isViewLoaded && (self.view.window != nil) {
                self.coinsTable.reloadData()
            }
        }
    }
    
    // MARK: Search bar delegates methods
    
    func searchBar(_: UISearchBar, textDidChange: String){
       //    Tells the delegate that the user changed the search text.
        if textDidChange.count == 0 {
            self.isSearch = false
        } else {
            self.isSearch = true
            self.searchForCoins(searchString: textDidChange)
        }
        self.coinsTable.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        if searchBar.text?.count == 0 {
            self.isSearch = false
            searchBar.resignFirstResponder()
        } else {
            self.isSearch = true
            self.searchForCoins(searchString: searchBar.text!)
        }
        searchBar.resignFirstResponder()
        self.coinsTable.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        self.isSearch = false
        searchBar.resignFirstResponder()
        self.coinsTable.reloadData()
    }
    
    // MARK: search coins localy
    func searchForCoins(searchString: String) {
        self.searchCoins.removeAll()
        for coin in sortedCoins{
            if (coin.name.lowercased().range(of: searchString.lowercased()) != nil) {
                searchCoins.append(coin)
            }
        }
        searchCoins.sort { return $0.name < $1.name }
    }

    
    
}
