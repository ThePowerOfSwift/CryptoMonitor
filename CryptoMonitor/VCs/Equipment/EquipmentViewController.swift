//
//  EquipmentViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 12.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

class EquipmentViewController: UIViewController {

    @IBOutlet weak private var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak private var contentView: UIView!
    
    var currentTab: Int = 0
    
    var currentViewController: UIViewController?
    
    var companiesVC: CompaniesViewController?
    
    var miningCoinsVC: MiningCoinsViewController?
    
    var equipment: Equipment?
    
    // MARK: ViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.configureBackBarButtonItem()
        self.segmentedControl.selectedSegmentIndex = currentTab
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentVC = currentViewController {
            currentVC.viewWillDisappear(animated)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        self.segmentedControl.selectedSegmentIndex = currentTab
        self.switchTab(segmentedControl)
    }
    
    // MARK: SegmentedControll methods

    @IBAction func switchTab(_ sender: UISegmentedControl) {
        
        guard let currentVC = currentViewController else {
            return
        }
        
        currentVC.view.removeFromSuperview()
        currentVC.removeFromParentViewController()
        
        let selectedTab = sender.selectedSegmentIndex
        self.changeActiveTab(selectedTab: selectedTab)
    }
    
    func changeActiveTab(selectedTab: Int) {
        let selectedVC: UIViewController?
        switch selectedTab {
        case 0:
            if companiesVC == nil {
                companiesVC = CompaniesViewController()
                selectedVC = companiesVC
            } else {
                selectedVC = companiesVC
            }
            guard let VC = selectedVC else {
                return
            }
            changeVC(vc: VC)
            updateCurrentTab(selectedTab)
        case 1:
            if miningCoinsVC == nil {
                miningCoinsVC = MiningCoinsViewController()
                selectedVC = miningCoinsVC
            } else {
                selectedVC = miningCoinsVC
            }
            guard let VC = selectedVC else {
                return
            }
            changeVC(vc: VC)
            updateCurrentTab(selectedTab)
        default:
            return
        }
    }
    
    func changeVC(vc: UIViewController) {
        self.addChildViewController(vc)
        vc.didMove(toParentViewController: self)
        
        vc.view.frame = self.contentView.bounds
        
        self.contentView.addSubview(vc.view)
        self.currentViewController = vc
    }
    
    // MARK: Download from Network methods
    
    func loadData() {
        if equipment == nil {
            if NetworkReachability.isConnectedToNetwork() {
                self.startActivityIndicator()
                NetworkService.requestWeb(endpoint: EquipmentEndpoint.getEquipment(), completionHandler: { (dataResponse) -> Void in
                    guard let value = dataResponse.result.value else {
                        return
                    }
                    self.equipment = Equipment(json: value)
                    self.stopActivityIndicator()
                    DispatchQueue.main.async {
                self.changeActiveTab(selectedTab: self.segmentedControl.selectedSegmentIndex)
                    }
                })
            } else {
                self.navigationController?.topViewController?.showNoInternetView()
            }
        }
    }
    
    // MARK: Update UI after downloading data
    
    func updateCurrentTab(_ tabIndex: Int) {
        guard let equipment1 = equipment else {
            return
        }
        currentTab = tabIndex
        switch tabIndex {
        case 0:
            companiesVC?.setData(miningData: equipment1.miningData.sorted {return $0.company < $1.company})
            companiesVC?.updateUI()
        case 1:
            miningCoinsVC?.setData(coinData: equipment1.coinData, miningData: equipment1.miningData)
        default:
            return
        }
    }
    
}
