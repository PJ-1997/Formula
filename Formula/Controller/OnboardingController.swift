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
    return label
  }()
  
  let exitButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Exit", for: .normal)
    button.backgroundColor = .green
    button.addTarget(self, action: #selector(handleExit), for: .touchUpInside)
    return button
  }()
  

  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
    
    exitButton.frame = CGRect(x: 20, y: 20, width: 60, height: 40)
    view.addSubview(exitButton)
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
