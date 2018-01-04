//
//  MainViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 12.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func configureTabBar() {
        let coinsVC = CoinsListViewController()
        let coinsNavigationVC = UINavigationController(rootViewController: coinsVC)
        coinsNavigationVC.tabBarItem = UITabBarItem(title: "Coins", image: #imageLiteral(resourceName: "ic_coins"), selectedImage: #imageLiteral(resourceName: "ic_coins"))
        coinsNavigationVC.isNavigationBarHidden = false
        
        let topPairsVC = TopPairsViewController()
        let topPairsNavigationVC = UINavigationController(rootViewController: topPairsVC)
        topPairsNavigationVC.tabBarItem = UITabBarItem(title: "TopPairs", image: #imageLiteral(resourceName: "ic_pair"), selectedImage: #imageLiteral(resourceName: "ic_pair"))
        
        let equipmentVC = EquipmentViewController()
        let equipmentNavigationVC = UINavigationController(rootViewController: equipmentVC)
        equipmentNavigationVC.tabBarItem = UITabBarItem(title: "Equipment", image: #imageLiteral(resourceName: "ic_equipment"), selectedImage: #imageLiteral(resourceName: "ic_equipment"))
        equipmentNavigationVC.isNavigationBarHidden = false
        
        let aboutVC = AboutAppViewController()
        let aboutNavigationVC = UINavigationController(rootViewController: aboutVC)
        aboutNavigationVC.tabBarItem = UITabBarItem(title: "About app", image: #imageLiteral(resourceName: "ic_about_app"), selectedImage: #imageLiteral(resourceName: "ic_about_app"))
        
        self.viewControllers = [coinsNavigationVC, topPairsNavigationVC, equipmentNavigationVC, aboutNavigationVC]
        
        self.tabBar.isTranslucent = false
    }
    
}
