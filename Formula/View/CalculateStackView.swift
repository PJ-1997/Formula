//
//  StackView.swift
//  Formula
//
//  Created by Pedro on 2/3/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit

class CalculateStackView: UIStackView, UITextFieldDelegate {
  
  //    var vc: CalculateController? {
  //        didSet {
  //            lefttextField.addTarget(vc, action: #selector(vc?.handleTextFields), for: .editingChanged)
  //            middleTextField.addTarget(vc, action: #selector(vc?.handleTextFields), for: .editingChanged)
  //            rightTextField.addTarget(vc, action: #selector(vc?.handleTextFields), for: .editingChanged)
  //            calculateButton.addTarget(vc, action: #selector(vc?.handleCalculate), for: .touchUpInside)
  //        }
  //    }
  
  //Top
  var formulaTitle: UILabel = {
    let label = UILabel()
    label.font = Theme.fonts.fontFormulaBold(size: 28)
    if UIDevice.current.screenType == .iPhone_XSMax || UIDevice.current.screenType == .iPhones_6Plus_6sPlus_7Plus_8Plus {
      label.font = Theme.fonts.fontFormulaBold(size: 32)
    } else if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
      label.font = Theme.fonts.fontFormulaBold(size: 25)
    } else {
      label.font = Theme.fonts.fontFormulaBold(size: 28)
    }
    label.text = "Formula Title"
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  var formulaImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "SquareRoot")
    imageView.contentMode = .center
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let topStackView = UIStackView()
  //Middle
  lazy var lefttextField: UITextField = {
    let textfield = UITextField()
    textfield.styleTextField()
    textfield.addTarget(self, action: #selector(handleLeftTextField), for: .editingChanged)
    return textfield
  }()
  
  lazy var middleTextField: UITextField = {
    let textfield = UITextField()
    textfield.styleTextField()
    textfield.addTarget(self, action: #selector(handleMiddleTextField), for: .editingChanged)
    return textfield
  }()
  
  lazy var rightTextField: UITextField = {
    let textfield = UITextField()
    textfield.styleTextField()
    textfield.addTarget(self, action: #selector(handleRightTextField), for: .editingChanged)
    return textfield
  }()
  
  let middleStackView = UIStackView()
  //bottom
  lazy var calculateButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Solve", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.masksToBounds = true
    button.backgroundColor = .red
    button.titleLabel?.font = Theme.fonts.fontFormulaBold(size: 20)
    button.addTarget(self, action: #selector(handleCalculate), for: .touchUpInside)
    return button
  }()
  
  var answerLabel: UILabel = {
    let label = UILabel()
    label.text = "Answer PlaceHolder"
    label.textAlignment = .center
    
    if UIDevice.current.screenType == .iPhone_XSMax || UIDevice.current.screenType == .iPhones_6Plus_6sPlus_7Plus_8Plus {
      label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
    } else if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
      label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    } else {
      label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    }
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let bottomStackView = UIStackView()
  
  var firstInput: Float?
  var secondInput: Float?
  var thirdInput: Float?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupStackViews()
  }
  
  override func layoutSubviews() {
    answerLabel.alpha = 0
    switch formulaTitle.text {
    case "Area of Square":
      lefttextField.placeholder = "s"
    case "Area of Circle":
      lefttextField.placeholder = "r"
    case "Area of a Trapizoid":
      lefttextField.placeholder = "B1"
      middleTextField.placeholder = "B2"
      rightTextField.placeholder = "H"
    case "Area of Rectangle":
      lefttextField.placeholder = "B"
      middleTextField.placeholder = "H"
      
    case "Density":
      lefttextField.placeholder = "Density"
      middleTextField.placeholder = "Mass"
      rightTextField.placeholder = "Volume"
    case "Speed":
      lefttextField.placeholder = "Speed"
      middleTextField.placeholder = "Distance"
      rightTextField.placeholder = "Time"
    case "Momentum":
      lefttextField.placeholder = "Momentum"
      middleTextField.placeholder = "Mass"
      rightTextField.placeholder = "Velocity"
    case "Force":
      lefttextField.placeholder = "Force"
      middleTextField.placeholder = "Mass"
      rightTextField.placeholder = "Acceleration"
    default:
      break
    }
  }
  
  //MARK:- Setup Functions
  func setupStackViews() {
    //MARK: Top StackView
    [formulaTitle, formulaImage].forEach({topStackView.addArrangedSubview($0)})
    topStackView.axis = .vertical
    topStackView.spacing = 20
    topStackView.isLayoutMarginsRelativeArrangement = true
    topStackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(topStackView)
    topStackView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8))
    formulaImage.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.18).isActive = true
    
    //MARK: Middle StackView
    middleStackView.addArrangedSubview(lefttextField)
    middleStackView.addArrangedSubview(middleTextField)
    middleStackView.addArrangedSubview(rightTextField)
    middleStackView.distribution = .fillEqually
    middleStackView.spacing = 8
    middleStackView.isLayoutMarginsRelativeArrangement = true
    middleStackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(middleStackView)
    middleStackView.anchor(top: topStackView.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 40, left: 8, bottom: 0, right: 8))
    middleStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    //MARK: Bottom StackView
    var topPadding: CGFloat!
    if UIDevice.current.screenType == .iPhone_XSMax || UIDevice.current.screenType == .iPhones_6Plus_6sPlus_7Plus_8Plus {
      topPadding = 80
    } else if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
      topPadding = 25
    } else {
      topPadding = 50
    }
    bottomStackView.addArrangedSubview(calculateButton)
    bottomStackView.addArrangedSubview(answerLabel)
    bottomStackView.axis = .vertical
    bottomStackView.distribution = .fillEqually
    bottomStackView.spacing = 8
    bottomStackView.isLayoutMarginsRelativeArrangement = true
    bottomStackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(bottomStackView)
    bottomStackView.anchor(top: middleStackView.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(top: topPadding, left: 8, bottom: 0, right: 8))
    bottomStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK:- Handle Functions
  @objc func handleLeftTextField(sender: UITextField) {
    let numFloat = (sender.text! as NSString).floatValue
    if sender.text?.isEmpty == true {
      firstInput = nil
    } else {
      firstInput = numFloat
    }
  }
  
  @objc func handleMiddleTextField(sender: UITextField) {
    let numFloat = (sender.text! as NSString).floatValue
    if sender.text?.isEmpty == true {
      secondInput = nil
    } else {
      secondInput = numFloat
    }
  }
  
  @objc func handleRightTextField(sender: UITextField) {
    let numFloat = (sender.text! as NSString).floatValue
    if sender.text?.isEmpty == true {
      thirdInput = nil
    } else {
      thirdInput = numFloat
    }
  }
  
  @objc func handleCalculate() {
    switch formulaTitle.text {
    case "Area of Square":
      let areaofSquareAns = Formulas.shared.areaofSquare(num: firstInput)
      answerLabel.text = areaofSquareAns
    case "Area of Circle":
      let areaofCircleAns = Formulas.shared.areaofCircle(num: firstInput)
      answerLabel.text = areaofCircleAns
    case "Area of a Trapizoid":
      let areaofTrapizoidAns = Formulas.shared.areaofTrapizoid(num1: firstInput, num2: secondInput, num3: thirdInput)
      answerLabel.text = areaofTrapizoidAns
    case "Area of Rectangle":
      let areaofRectangleAns = Formulas.shared.areaofRectangle(num1: firstInput, num2: secondInput)
      answerLabel.text = areaofRectangleAns
      
    case "Density":
      let density = Formulas.shared.densityFormula(density: firstInput, mass: secondInput, volume: thirdInput)
      answerLabel.text = density
    case "Speed":
      let speed = Formulas.shared.speedFormula(speed: firstInput, distance: secondInput, time: thirdInput)
      answerLabel.text = speed
    case "Momentum":
      let momentum = Formulas.shared.momentumFormula(momentum: firstInput, mass: secondInput, velocity: thirdInput)
      answerLabel.text = momentum
    case "Force":
      let force = Formulas.shared.forceFormula(force: firstInput, mass: secondInput, acceleration: thirdInput)
      answerLabel.text = force
    default:
      break
    }
    answerLabel.alpha = 1
  }
  
}
