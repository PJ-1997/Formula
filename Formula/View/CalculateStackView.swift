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
    label.text = "Formula Title"
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  var formulaImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "MC")
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
    label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
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
    //MARK: Top StackVie
    topStackView.addArrangedSubview(formulaTitle)
    topStackView.addArrangedSubview(formulaImage)
    topStackView.axis = .vertical
    topStackView.spacing = 8
    topStackView.isLayoutMarginsRelativeArrangement = true
    
    //Enables auto layout
    topStackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(topStackView)
    
    topStackView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8))
    formulaImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    //MARK: Middle StackView
    middleStackView.addArrangedSubview(lefttextField)
    middleStackView.addArrangedSubview(middleTextField)
    middleStackView.addArrangedSubview(rightTextField)
    middleStackView.distribution = .fillEqually
    middleStackView.spacing = 8
    middleStackView.isLayoutMarginsRelativeArrangement = true
    
    //Enables auto layout
    middleStackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(middleStackView)
    
    middleStackView.anchor(top: topStackView.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 20, left: 8, bottom: 0, right: 8))
    middleStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    //MARK: Bottom StackView
    bottomStackView.addArrangedSubview(calculateButton)
    bottomStackView.addArrangedSubview(answerLabel)
    bottomStackView.axis = .vertical
    bottomStackView.distribution = .fillEqually
    bottomStackView.spacing = 8
    bottomStackView.isLayoutMarginsRelativeArrangement = true
    
    //Enables auto layout
    bottomStackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(bottomStackView)
    
    bottomStackView.anchor(top: middleStackView.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 50, left: 8, bottom: 0, right: 8))
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
      let areaofSquareAns = areaofSquare(num: firstInput)
      answerLabel.text = areaofSquareAns
    case "Area of Circle":
      let areaofCircleAns = areaofCircle(num: firstInput)
      answerLabel.text = areaofCircleAns
    case "Area of a Trapizoid":
      let areaofTrapizoidAns = areaofTrapizoid(num1: firstInput, num2: secondInput, num3: thirdInput)
      answerLabel.text = areaofTrapizoidAns
    case "Area of Rectangle":
      let areaofRectangleAns = areaofRectangle(num1: firstInput, num2: secondInput)
      answerLabel.text = areaofRectangleAns
      
    case "Density":
      let density = densityFormula(density: firstInput, mass: secondInput, volume: thirdInput)
      answerLabel.text = density
    case "Speed":
      let speed = speedFormula(speed: firstInput, distance: secondInput, time: thirdInput)
      answerLabel.text = "\(speed)"
    case "Momentum":
      let momentum = momentumFormula(momentum: firstInput, mass: secondInput, velocity: thirdInput)
      answerLabel.text = "\(momentum)"
    case "Force":
      let force = forceFormula(force: firstInput, mass: secondInput, acceleration: thirdInput)
      answerLabel.text = "\(force)"
    default:
      break
    }
    answerLabel.alpha = 1
  }
  
  //MARK:- Logic
  //Math
  func areaofSquare(num: Float?) -> String {
    var ans: Float!
    if num == nil {
      return "Put value in"
    } else if num! <= 0 {
      return "No real Solution"
    } else {
      ans = powf(num!, 2)
      let round = (ans * 100).rounded()/100
      ans = round
      return "A = \(ans!)"
    }
  }
  
  func areaofCircle(num: Float?) -> String {
    var ans: Float!
    if num == nil {
      return "Put value in"
    } else if num! <= 0 {
      return "No real Solution"
    } else {
      let pi = (Float.pi)
      ans = powf(num!, 2) * pi
      let round = (ans * 1000).rounded()/1000
      ans = round
      return "A = \(ans!)"
    }
  }
  
  func areaofTrapizoid(num1: Float?, num2: Float?, num3: Float?) -> String {
    var ans: Float!
    if num1 == nil || num2 == nil || num3 == nil{
      return "Fill all boxes"
    } else if num1! <= 0 || num2! <= 0 || num3! <= 0 {
      return "No real Solution"
    } else {
      let base = num1! + num2!
      let times = base * num3!
      ans = times * 0.5
      let round = (ans * 1000).rounded()/1000
      ans = round
      return "A = \(ans!)"
    }
  }
  
  func areaofRectangle(num1: Float?, num2: Float?) -> String {
    var ans: Float!
    if num1 == nil || num2 == nil {
      return "Fill all boxes"
    } else if num1! <= 0 || num2! <= 0 {
      return "No real Solution"
    } else {
      ans = num1! * num2!
      let round = (ans * 1000).rounded()/1000
      ans = round
      return "A = \(ans!)"
    }
  }
  
  //Science
  //TODO:- Fix Science Formulas
  func densityFormula(density: Float?, mass: Float?, volume: Float?) -> String {
    var ans: Float!
    if (mass != nil && volume != nil) {
      ans = mass! / volume!
      print("Density is Empty")
      return "D = \(ans!)"
    } else if (density != nil && volume != nil) {
      ans = volume! * density!
      print("Mass is Empty")
      return "M = \(ans!)"
    } else if (mass != nil && density != nil) {
      ans = mass! * density!
      print("Volume is Empty")
      return "V = \(ans!)"
      
    } else if density == nil || mass == nil || volume == nil {
      return "Fill two boxes"
      
    } else if density! <= 0 {
      
      return "No real solution"
    } else {
      return "shit"
    }
    
  }
  
  func speedFormula(speed: Float?, distance: Float?, time: Float?) -> Float {
    var ans: Float!
    if (distance != nil && time != nil) {
      ans = distance! / time!
      print("Speed is Empty")
    } else if (speed != nil && time != nil) {
      ans = time! * speed!
      print("Distance is Empty")
    } else if (distance != nil && speed != nil) {
      ans = distance! * speed!
      print("Time is Empty")
    } else {
      print("Something is wrong")
      return 0
    }
    return ans
  }
  
  func momentumFormula(momentum: Float?, mass: Float?, velocity: Float?) -> Float {
    var ans: Float!
    if (mass != nil && velocity != nil) {
      ans = mass! * velocity!
      print("Momentum is Empty")
    } else if (momentum != nil && velocity != nil) {
      ans = momentum! / velocity!
      print("Mass is Empty")
    } else if (mass != nil && momentum != nil) {
      ans = momentum! / mass!
      print("Velocity is Empty")
    } else {
      print("Something is wrong")
      return 0
    }
    return ans
  }
  
  func forceFormula(force: Float?, mass: Float?, acceleration: Float?) -> Float {
    var ans: Float!
    if (mass != nil && acceleration != nil) {
      ans = mass! * acceleration!
      print("Force is Empty")
    } else if (force != nil && acceleration != nil) {
      ans = force! / acceleration!
      print("Mass is Empty")
    } else if (mass != nil && force != nil) {
      ans = force! / mass!
      print("Acceleration is Empty")
    } else {
      print("Something is wrong")
      return 0
    }
    return ans
  }
  
}
