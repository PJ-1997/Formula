//
//  OnboardingController.swift
//  Formula
//
//  Created by Pedro on 4/1/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController {
  //FIXME: Refactor to View
  
  fileprivate let onboardingStackView = OnBoardingStackView()
  
  //MARK:- ViewController's Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  //MARK:- Handle Functions
  func setup() {
    view.backgroundColor = .white
    onboardingStackView.continueButton.addTarget(self, action: #selector(handleExit), for: .touchUpInside)
    view.addSubview(onboardingStackView)
    onboardingStackView.fillSuperview()
  }
  
  //FIXME:- !!!Not properly showing at start
  @objc func handleExit() {
    let layout = UICollectionViewFlowLayout()
    let favoriteController = FavoritesController(collectionViewLayout: layout)
    let navFavoriteController = UINavigationController(rootViewController: favoriteController)
    navFavoriteController.modalPresentationStyle = .overFullScreen
    self.present(navFavoriteController, animated: true, completion: {
      UserDefaults.standard.set("true", forKey: "onBoarding")
    })
  }

  
}
