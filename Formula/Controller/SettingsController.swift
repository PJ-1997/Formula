//
//  SettingsController.swift
//  Formula
//
//  Created by Pedro on 12/27/18.
//  Copyright © 2018 Pedro. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController {
    
    //MARK:- ViewController's Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
    }
    
    //MARK:- Setup Functions
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Settings"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDismiss))
    }
    
    //MARK: - Handle Functions
    @objc func handleDismiss() {
        self.dismiss(animated: true, completion: nil)
    }

}
