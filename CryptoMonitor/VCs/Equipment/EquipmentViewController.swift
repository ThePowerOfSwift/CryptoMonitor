//
//  EquipmentViewController.swift
//  CryptoMonitor
//
//  Created by Serg Liamthev on 12.12.17.
//  Copyright © 2017 Serg Liamthev. All rights reserved.
//

import UIKit

class EquipmentViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var contentView: UIView!
    
    var currentViewController: UIViewController?
    
    var companiesVC: CompaniesViewController?
    
    var miningCoinsVC: MiningCoinsViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.segmentedControl.selectedSegmentIndex = 0
        self.switchTab(segmentedControl)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentVC = currentViewController{
            currentVC.viewWillDisappear(animated)
        }
    }

    @IBAction func switchTab(_ sender: UISegmentedControl) {
        
        if currentViewController != nil{
            self.currentViewController!.view.removeFromSuperview()
            self.currentViewController!.removeFromParentViewController()
        }
        let selectedTab = sender.selectedSegmentIndex
        self.changeActiveTab(selectedTab: selectedTab)
    }
    
    func changeActiveTab(selectedTab: Int){
        let selectedVC: UIViewController?
        switch selectedTab {
        case 0:
            if companiesVC == nil{
                selectedVC = CompaniesViewController()
            } else {
                selectedVC = companiesVC
            }
            changeVC(vc: selectedVC!)
        case 1:
            if miningCoinsVC == nil{
                selectedVC = MiningCoinsViewController()
            } else {
                selectedVC = miningCoinsVC
            }
            changeVC(vc: selectedVC!)
        default:
            return
        }
    }
    
    func changeVC(vc: UIViewController){
        self.addChildViewController(vc)
        vc.didMove(toParentViewController: self)
        
        vc.view.frame = self.contentView.bounds
        
        self.contentView.addSubview(vc.view)
        self.currentViewController = vc
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
}
