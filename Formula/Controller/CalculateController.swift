//
//  CalculateController.swift
//  Formula
//
//  Created by Pedro on 1/3/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit

class CalculateController: UIViewController {
  
  let calculateStackView = CalculateStackView()
  
  //MARK:- ViewController's Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    removeStackViews()
    setupNavigation()
    //        calculateStackView.vc = self
    self.hideKeyboard()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(true)
    self.dismissKeyboard()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.view.setNeedsLayout()
    calculateStackView.calculateButton.frame = calculateStackView.calculateButton.bounds
    calculateStackView.calculateButton.layer.cornerRadius = calculateStackView.calculateButton.frame.size.height/2
    //FIXME: Messes up when in landscape
    calculateStackView.calculateButton.setGradientBackground(colorOne: UIColor.gradientLightBlue, colorTwo: UIColor.gradientDarkBlue)
  }
  
  //MARK:- Setup Functions
  func removeStackViews() {
    switch calculateStackView.formulaTitle.text {
    case "Area of Square":
      calculateStackView.middleTextField.removeFromSuperview()
      calculateStackView.rightTextField.removeFromSuperview()
      calculateStackView.formulaImage.image = #imageLiteral(resourceName: "SquareRoot")
    case "Area of Circle":
      calculateStackView.middleTextField.removeFromSuperview()
      calculateStackView.rightTextField.removeFromSuperview()
      calculateStackView.formulaImage.image = #imageLiteral(resourceName: "Circle")
    case "Area of a Trapizoid":
      calculateStackView.formulaImage.image = #imageLiteral(resourceName: "Trap")
    case "Area of Rectangle":
      calculateStackView.rightTextField.removeFromSuperview()
      calculateStackView.formulaImage.image = #imageLiteral(resourceName: "Rect")
      
    case "Density":
      calculateStackView.formulaImage.image = #imageLiteral(resourceName: "Density")
    case "Speed":
      calculateStackView.formulaImage.image = #imageLiteral(resourceName: "Speed")
    case "Momentum":
      calculateStackView.formulaImage.image = #imageLiteral(resourceName: "Mom")
    case "Force":
      calculateStackView.formulaImage.image = #imageLiteral(resourceName: "Force")
    default:
      break
    }
  }
  
  func setupNavigation() {
    navigationItem.title = "Calculate"
    view.backgroundColor = UIColor.greyFormula
    calculateStackView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(calculateStackView)
    calculateStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: nil)
    calculateStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90).isActive = true
    calculateStackView.centerXInSuperview()
  }

}
