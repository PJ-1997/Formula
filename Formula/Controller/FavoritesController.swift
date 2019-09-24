//
//  ViewController.swift
//  Formula
//
//  Created by Pedro on 12/9/18.
//  Copyright © 2018 Pedro. All rights reserved.
//

import UIKit

let notificationKey = "pm.fetchData"

class FavoritesController: UICollectionViewController {
  
  private let nameofkey = Notification.Name(rawValue: notificationKey)
  
  fileprivate let cellId = "cellId"
  fileprivate var favoritedFormulas = UserDefaults.standard.savedFormulas()
  fileprivate let favoriteIsEmptyStackView = FavoritedIsEmptyStackView()
  
  //MARK:- ViewController's Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    setupNavigationItems()
    setupEmptyStackView()
    createObservers()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    favoritedFormulas = UserDefaults.standard.savedFormulas()
    collectionView.reloadData()
    if favoritedFormulas.isEmpty {
      favoriteIsEmptyStackView.alpha = 1
    } else {
      favoriteIsEmptyStackView.alpha = 0
    }
  }
  
  //MARK:- Observer Code
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  func createObservers() {
    NotificationCenter.default.addObserver(self, selector: #selector(refresh), name: nameofkey, object: nil)
  }
  
  @objc func refresh() {
    favoritedFormulas = UserDefaults.standard.savedFormulas()
    collectionView.reloadData()
    if favoritedFormulas.isEmpty {
      favoriteIsEmptyStackView.alpha = 1
    } else {
      favoriteIsEmptyStackView.alpha = 0
    }
    print(favoritedFormulas.map{$0.title})
  }
  
  //MARK:- Handle Functions
  @objc func handleSearchPush() {
    let sVC = SearchController()
    //Put
    let searchController = UINavigationController.init(rootViewController: sVC)
    self.present(searchController, animated: true, completion: nil)
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
  fileprivate func setupEmptyStackView() {
    let faceImageView = favoriteIsEmptyStackView.faceImageView
    favoriteIsEmptyStackView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(favoriteIsEmptyStackView)
    faceImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.70).isActive = true
    faceImageView.heightAnchor.constraint(equalTo: faceImageView.widthAnchor).isActive = true
    favoriteIsEmptyStackView.centerXInSuperview()
    favoriteIsEmptyStackView.centerYInSuperview()
  }
  
  fileprivate func setupCollectionView() {
    collectionView.backgroundColor = UIColor.greyFormula
    collectionView.register(SubjectsCell.self, forCellWithReuseIdentifier: cellId)
    
    let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
    collectionView.addGestureRecognizer(gesture)
  }
  
  fileprivate func setupNavigationItems() {
    navigationItem.title = "Favorites"
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(handleSearchPush))
    navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
  }
  
  //MARK:- CollectionView Functions
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let calculateController = CalculateController()
    let favoritedFormulaItem = favoritedFormulas[indexPath.item]
    calculateController.calculateStackView.formulaTitle.text = favoritedFormulaItem.title
    navigationController?.pushViewController(calculateController, animated: true)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if favoritedFormulas.isEmpty && favoriteIsEmptyStackView.alpha == 0 {
      UIView.animate(withDuration: 0.58) {
        self.favoriteIsEmptyStackView.alpha = 1
      }
    }
    return favoritedFormulas.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SubjectsCell
    cell.formula = favoritedFormulas[indexPath.item]
    return cell
  }
  
}

