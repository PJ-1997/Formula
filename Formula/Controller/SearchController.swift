//
//  SearchController.swift
//  Formula
//
//  Created by Pedro on 12/26/18.
//  Copyright © 2018 Pedro. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.greyFormula
        tableView.allowsSelection = true
        return tableView
    }()
    
    let segmentedController: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Math", "Science"])
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleSegment(sender:)), for: .valueChanged)
        sc.style()
        return sc
    }()
    
    let cellId = "cellId"
    var listOfFormulas = UserDefaults.standard.savedFormulas()
    var mathFormulas = [FormulaModel]()
    var scienceFormulas = [FormulaModel]()
    lazy var rowsToDisplay = mathFormulas
    
    //MARK:- ViewController's Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.greyFormula
        setupSegmentedController(segmentedController)
        setupNavigationItems()
        setupTableView()
        mathFormulas = Formulas.shared.addMathFormulas()
        scienceFormulas = Formulas.shared.addScienceFormulas()
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
        view.addSubview(segmentedController)
        segmentedController.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor , padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        segmentedController.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //MARK:- Handle Functions
    @objc func handleDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleSegment(sender: UISegmentedControl) {
        switch segmentedController.selectedSegmentIndex {
        case 0:
            rowsToDisplay = mathFormulas
        case 1:
            rowsToDisplay = scienceFormulas
        default:
            break
        }
        tableView.reloadData()
    }
}
