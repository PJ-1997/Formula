//
//  ViewController.swift
//  Formula
//
//  Created by Pedro on 12/9/18.
//  Copyright © 2018 Pedro. All rights reserved.
//

import UIKit

class FavoritesController: UICollectionViewController {
  
  fileprivate let cellId = "cellId"
  var favoritedFormulas = UserDefaults.standard.savedFormulas()
  
  //MARK:- ViewController's Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    setupNavigationItems()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    favoritedFormulas = UserDefaults.standard.savedFormulas()
    collectionView.reloadData()
  }
  
  //MARK:- Handle Functions
  @objc func handleSearchPush() {
    let searchController = UINavigationController.init(rootViewController: SearchController())
    self.present(searchController, animated: true, completion: nil)
  }
  
  @objc func handleSettingsPush() {
    let settingsController = UINavigationController.init(rootViewController: SettingsController())
    self.present(settingsController, animated: true, completion: nil)
  }
  
  @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
    gesture.minimumPressDuration = 0.3
    let location = gesture.location(in: collectionView)
    guard let selectedIndexPath = collectionView.indexPathForItem(at: location) else { return }
    guard let cell = collectionView.cellForItem(at: selectedIndexPath) as? SubjectsCell else { return }
    if gesture.state == .began {
      cell.scaleAnimate(scale: 0.92)
      let alertController = UIAlertController(title: "Remove Formula", message: nil, preferredStyle: .actionSheet)
      alertController.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (_) in
        let selectedFormula = self.favoritedFormulas[selectedIndexPath.item]
        self.favoritedFormulas.remove(at: selectedIndexPath.item)
        self.collectionView.deleteItems(at: [selectedIndexPath])
        UserDefaults.standard.deleteFormula(formula: selectedFormula)
      }))
      alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
      present(alertController, animated: true)
    }
  }
  
  //MARK:- Setup Functions
  fileprivate func setupCollectionView() {
    collectionView.backgroundColor = UIColor.greyFormula
    collectionView.register(SubjectsCell.self, forCellWithReuseIdentifier: cellId)
    
    let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
    collectionView.addGestureRecognizer(gesture)
  }
  
  fileprivate func setupNavigationItems() {
    navigationItem.title = "Favorites"
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(handleSettingsPush))
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(handleSearchPush))
    navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
  }
  
  //MARK:- CollectionView Functions
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let calculateController = CalculateController()
    let favoritedFormulaItem = favoritedFormulas[indexPath.item]
    //FIXME: Hide Home Button and Save Image (assets or with json)
    calculateController.calculateStackView.formulaTitle.text = favoritedFormulaItem.title
    navigationController?.pushViewController(calculateController, animated: true)
  }
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //        if favoritedFormulas.isEmpty {
    //            collectionView.backgroundColor = .red
    //        } else {
    //            collectionView.backgroundColor = .green
    //        }
    return favoritedFormulas.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SubjectsCell
    cell.formula = self.favoritedFormulas[indexPath.item]
    return cell
  }
  
}

