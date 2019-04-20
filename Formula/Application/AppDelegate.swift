//
//  AppDelegate.swift
//  Formula
//
//  Created by Pedro on 12/9/18.
//  Copyright © 2018 Pedro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  //ADMob real: ca-app-pub-1227642814998753~7688090354
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let layout = UICollectionViewFlowLayout()
    let favoriteController = FavoritesController(collectionViewLayout: layout)
    window = UIWindow()
    window?.makeKeyAndVisible()
    var vc: UIViewController!
    if (UserDefaults.standard.value(forKey: "onBoarding") == nil) {
      //shows onboarding screen
      vc = OnboardingController()
    } else {
      //shows main screen
      //      vc = UINavigationController(rootViewController: favoriteController)
      vc = OnboardingController()
    }
    self.window?.rootViewController = vc
    setupAppearance()
    return true
  }
  
  fileprivate func setupAppearance() {
    //Different Controllers
    //    window?.rootViewController = UINavigationController(rootViewController: favoriteController)
    //    window?.rootViewController = UINavigationController(rootViewController: SearchController())
    //    window?.rootViewController = UINavigationController(rootViewController: CalculateController())
    
    //Apperence
    let navigationBarAppearace = UINavigationBar.appearance()
    var font: UIFont!
    navigationBarAppearace.barTintColor = UIColor.blueFormula
    navigationBarAppearace.tintColor = .white
    
    if UIDevice.current.screenType == .iPhone_XSMax || UIDevice.current.screenType == .iPhones_6Plus_6sPlus_7Plus_8Plus {
      font = Theme.fonts.fontFormulaBold(size: 23)
    } else if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
      font = Theme.fonts.fontFormulaBold(size: 18)
    } else {
      font = Theme.fonts.fontFormulaBold(size: 20)
    }
    
    let attributes  = [
      NSAttributedString.Key.foregroundColor: UIColor.white,
      NSAttributedString.Key.font: font
    ]
    UINavigationBar.appearance().titleTextAttributes = attributes as [NSAttributedString.Key : Any]
  }
  
}

