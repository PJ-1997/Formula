//
//  SearchController.swift
//  Formula
//
//  Created by Pedro on 12/26/18.
//  Copyright © 2018 Pedro. All rights reserved.
//

import UIKit
//TODO: 1. Add to userDefaults
class SearchController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.greyFormula
        tableView.allowsSelection = true
        return tableView
    }()
    
    let cellId = "cellId"
    var listOfFormulas = UserDefaults.standard.savedFormulas()
    var mathFormulas = [FormulaModel]()
    var scienceFormulas = [FormulaModel]()
    let subjects = ["Math", "Science"]
    lazy var segmentedController = UISegmentedControl(items: subjects)
    
    //MARK:- ViewController's Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.greyFormula
        setupSegmentedController(segmentedController)
        setupNavigationItems()
        setupTableView()
        mathFormulas = addMathFormulas()
        scienceFormulas = addScienceFormulas()
    }
    
    //MARK:- Setup Functions
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Search"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDismiss))
    }
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FormulasCell.self, forCellReuseIdentifier: cellId)
        view.addSubview(tableView)
        tableView.anchor(top: segmentedController.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
    }
    
    fileprivate func setupSegmentedController(_ segmentedController: UISegmentedControl) {
        segmentedController.style()
        segmentedController.addTarget(self, action: #selector(handleSegment(sender:)), for: .valueChanged)
        view.addSubview(segmentedController)
        segmentedController.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor , padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        segmentedController.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //MARK:- Handle Functions
    @objc func handleDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleSegment(sender: UISegmentedControl) {
        tableView.reloadData()
    }
}
