//
//  CompaniesViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 26.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit

class CompaniesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var miningData: [MiningData] = []
    
    let cellName = "CompanyTableViewCell"
    
    @IBOutlet weak var companiesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configureTableView(){
        companiesTable.register(UINib(nibName: cellName,
                                      bundle: Bundle.main), forCellReuseIdentifier: cellName)
        companiesTable.delegate = self
        companiesTable.dataSource = self
        companiesTable.estimatedRowHeight = 120
        companiesTable.rowHeight = 120
    }
    
    func setData(miningData: [MiningData]){
        self.miningData = miningData
    }
    
    func updateUI(){
       companiesTable.reloadData()
    }
    
    //MARK: Table View Delegete methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = miningData[indexPath.row]
        let companyDetailsVC = CompanyDetailsViewController()
        companyDetailsVC.setData(data)
        navigationController?.pushViewController(companyDetailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    // MARK: Table View Data Source methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return miningData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = companiesTable.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CompanyTableViewCell
        cell.configure(miningData[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
}
