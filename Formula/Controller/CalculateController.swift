//
//  CalculateController.swift
//  Formula
//
//  Created by Pedro on 1/3/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit
//TODO: 2 Add traits for iphone 6 and iphone max
class CalculateController: UIViewController {
    
    let calculateStackView = CalculateStackView()
    
    //MARK:- ViewController's Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        calculateStackView.vc = self
        self.hideKeyboard()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.dismissKeyboard()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.setNeedsLayout()
        calculateStackView.calculateButton.layer.cornerRadius = calculateStackView.calculateButton.frame.size.height/2
        //FIXME: Messes up when in landscape
        calculateStackView.calculateButton.setGradientBackground(colorOne: UIColor.gradientLightBlue, colorTwo: UIColor.gradientDarkBlue)
    }
    
    //MARK:- Setup Functions
    func setupNavigation() {
        navigationItem.title = "Calculate"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Home", style: .done, target: self, action: #selector(handleDismissToFavorite))
        view.backgroundColor = UIColor.greyFormula
        
        calculateStackView.rightTextField.delegate = self
        calculateStackView.middleTextField.delegate = self
        calculateStackView.lefttextField.delegate = self
        
        view.addSubview(calculateStackView)
        calculateStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
    }

    //MARK:- Handle Functions
    @objc func handleTextFields(sender: UITextField) {
        print(sender.text!)
    }
    
    @objc func handleCalculate() {
        print("Calculate")
    }
    
    @objc func handleDismissToFavorite() {
        print("Going home")
        self.dismiss(animated: true, completion: nil)
    }
    
}
