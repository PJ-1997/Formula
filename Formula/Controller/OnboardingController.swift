//
//  OnboardingController.swift
//  Formula
//
//  Created by Pedro on 4/1/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController {
  //FIME: Make info stack view and images smaller for max phones
  //FIXME: Refactor to View
  let welcomeLabel: UILabel = {
    let label = UILabel()
    label.text = "Welcome to"
    if UIDevice.current.screenType == .iPhone_XSMax || UIDevice.current.screenType == .iPhones_6Plus_6sPlus_7Plus_8Plus {
      label.font = UIFont.systemFont(ofSize: 44, weight: .black)
    } else if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
      label.font = UIFont.systemFont(ofSize: 40, weight: .black)
    } else {
      label.font = UIFont.systemFont(ofSize: 42, weight: .black)
    }
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let formulaLabel: UILabel = {
    let label = UILabel()
    label.text = "Formulas"
    if UIDevice.current.screenType == .iPhone_XSMax || UIDevice.current.screenType == .iPhones_6Plus_6sPlus_7Plus_8Plus {
      label.font = UIFont.systemFont(ofSize: 44, weight: .black)
    } else if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
      label.font = UIFont.systemFont(ofSize: 40, weight: .black)
    } else {
      label.font = UIFont.systemFont(ofSize: 42, weight: .black)
    }
    label.textColor = UIColor.blueFormula
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  //MARK: Horiz. Stack Views
  //Search
  let searchInfo = UILabel(text: "Search from different formulas from math and science")
  let searchImage = UIImageView(image: #imageLiteral(resourceName: "searchOn"), insets: nil)
  
  //Favorite
  let favoriteInfo = UILabel(text: "Favorite your most used formulas and delete by long pressing")
  let favoriteImage = UIImageView(image: #imageLiteral(resourceName: "fav.pdf"), insets: nil)
  
  //Clean
  let cleanInfo = UILabel(text: "Clean and straight forward design")
  let cleanImage = UIImageView(image: #imageLiteral(resourceName: "thumbup.pdf"), insets: nil)
  
  let continueButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Continue", for: .normal)
    button.backgroundColor = UIColor.blueFormula
    button.addTarget(self, action: #selector(handleExit), for: .touchUpInside)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    if UIDevice.current.screenType == .iPhone_XSMax || UIDevice.current.screenType == .iPhones_6Plus_6sPlus_7Plus_8Plus {
       button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    } else if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
       button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
    } else {
       button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }
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
    searchStackView.spacing = 8
    searchImage.widthAnchor.constraint(equalTo: searchImage.heightAnchor).isActive = true

    //Favorite
    let favoriteStackView = UIStackView(arrangedSubviews: [favoriteImage, favoriteInfo])
    favoriteStackView.spacing = 8
    favoriteImage.widthAnchor.constraint(equalTo: favoriteImage.heightAnchor).isActive = true
    
    //Clean
    let cleanStackView = UIStackView(arrangedSubviews: [cleanImage, cleanInfo])
    cleanStackView.spacing = 8
    cleanImage.widthAnchor.constraint(equalTo: cleanImage.heightAnchor).isActive = true
    
    let infoVerticalStackView = VerticalStackView(arrangedSubviews: [searchStackView, favoriteStackView, cleanStackView], spacing: 30)
    infoVerticalStackView.distribution = .fillEqually
    
    //Button
    continueButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
//    continueButton.heightAnchor.constraint(equalTo: continueButton.widthAnchor, multiplier: 0.15).isActive = true
    
    let masterVerticalStackView = VerticalStackView(arrangedSubviews: [topVerticalStackView, infoVerticalStackView], spacing: 22)
    view.addSubview(masterVerticalStackView)
    view.addSubview(continueButton)
    masterVerticalStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80).isActive = true
    masterVerticalStackView.centerXInSuperview()
    masterVerticalStackView.centerYInSuperview()
    if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
      masterVerticalStackView.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -30).isActive = true
    }
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
