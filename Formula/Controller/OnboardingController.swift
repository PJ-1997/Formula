//
//  OnboardingController.swift
//  Formula
//
//  Created by Pedro on 4/1/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit


class OnboardingController: UIViewController {
  
  let welcomeLabel: UILabel = {
    let label = UILabel()
    //    label.backgroundColor = .blue
    label.text = "Welcome to"
    label.font = UIFont.systemFont(ofSize: 42, weight: .black)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let formulaLabel: UILabel = {
    let label = UILabel()
    label.text = "Formulas"
    label.font = UIFont.systemFont(ofSize: 42, weight: .black)
    label.textColor = UIColor.blueFormula
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let greatLabel: UILabel = {
    let label = UILabel()
    label.text = "Great for calculating Formulas."
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  //MARK: Horiz. Stack Views
  //Search
  let searchInfo = UILabel(text: "Search from different formulas from math and science")
  let searchImage: UIImageView = {
    let iv = UIImageView()
    iv.backgroundColor = .red
    iv.translatesAutoresizingMaskIntoConstraints = false
    return iv
  }()
  
  //Favorite
  let favoriteInfo = UILabel(text: "Favorite your most used formulas and delete by long pressing")
  let favoriteImage: UIImageView = {
    let iv = UIImageView()
    iv.backgroundColor = .red
    iv.translatesAutoresizingMaskIntoConstraints = false
    return iv
  }()
  
  //Clean
  let cleanInfo = UILabel(text: "Clean and straight forward Design")
  let cleanImage: UIImageView = {
    let iv = UIImageView()
    iv.backgroundColor = .red
    iv.translatesAutoresizingMaskIntoConstraints = false
    return iv
  }()
  
  
  
  let continueButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Continue", for: .normal)
    button.backgroundColor = UIColor.blueFormula
    button.addTarget(self, action: #selector(handleExit), for: .touchUpInside)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 6
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupStackView()
  }
  
  
  //MARK:- Handle Functions
  func setupStackView() {
    
    //Top (Welcome and Formula) Vertical StackView
    let topVerticalStackView = VerticalStackView(arrangedSubviews: [welcomeLabel, formulaLabel], spacing: 0)
    
    //Search
    let searchStackView = UIStackView(arrangedSubviews: [searchImage, searchInfo])
    searchStackView.spacing = 16
    searchImage.widthAnchor.constraint(equalTo: searchImage.heightAnchor).isActive = true
    
    //Favorite
    let favoriteStackView = UIStackView(arrangedSubviews: [favoriteImage, favoriteInfo])
    favoriteStackView.spacing = 16
    favoriteImage.widthAnchor.constraint(equalTo: favoriteImage.heightAnchor).isActive = true
    
    //Clean
    let cleanStackView = UIStackView(arrangedSubviews: [cleanImage, cleanInfo])
    cleanStackView.spacing = 16
    cleanImage.widthAnchor.constraint(equalTo: cleanImage.heightAnchor).isActive = true
    
    let infoVerticalStackView = VerticalStackView(arrangedSubviews: [searchStackView, favoriteStackView, cleanStackView], spacing: 30)
    infoVerticalStackView.distribution = .fillEqually
    
    //Button
    continueButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    
    let masterVerticalStackView = VerticalStackView(arrangedSubviews: [topVerticalStackView, greatLabel, infoVerticalStackView], spacing: 22)
    view.addSubview(masterVerticalStackView)
    view.addSubview(continueButton)
    masterVerticalStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80).isActive = true
    masterVerticalStackView.centerXInSuperview()
    masterVerticalStackView.centerYInSuperview()
    continueButton.centerXInSuperview()
    continueButton.anchor(top: nil, leading: masterVerticalStackView.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: masterVerticalStackView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 40, right: 0))
    infoVerticalStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.40).isActive = true
    
  }
  
  @objc func handleExit() {
    print("Exit")
    let layout = UICollectionViewFlowLayout()
    let favoriteController = FavoritesController(collectionViewLayout: layout)
    let navFavoriteController = UINavigationController(rootViewController: favoriteController)
    self.present(navFavoriteController, animated: true, completion: {
      UserDefaults.standard.set("true", forKey: "onBoarding")
    })
  }
  
}

//MARK:- Extensions
extension UILabel {
  convenience init(text: String) {
    self.init(frame: .zero)
    self.text = text
    self.font = UIFont.systemFont(ofSize: 15)
    self.numberOfLines = 0
    self.minimumScaleFactor = 0.5
    self.adjustsFontSizeToFitWidth = true
  }
}

class VerticalStackView: UIStackView {
  
  init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
    super.init(frame: .zero)
    arrangedSubviews.forEach({addArrangedSubview($0)})
    self.spacing = spacing
    self.axis = .vertical
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}