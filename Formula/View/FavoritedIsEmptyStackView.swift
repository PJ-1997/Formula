//
//  FavoritedisEmptyView.swift
//  Formula
//
//  Created by Pedro on 4/12/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit

class FavoritedIsEmptyStackView: UIStackView {
  
  let faceImageView: UIImageView = {
    let iv = UIImageView(image: #imageLiteral(resourceName: "Face Favorite.pdf"))
    iv.translatesAutoresizingMaskIntoConstraints = false
    return iv
  }()
  
  let topText: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Nothing here yet!"
    label.font = UIFont(name: "AvenirNext-Medium", size: 19)
    label.textColor = UIColor.rgb(red: 79, green: 79, blue: 79)
    label.textAlignment = .center
    return label
  }()
  
  let bottomText: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Favorite some formulas"
    label.font = UIFont(name: "AvenirNext-Medium", size: 17)
    label.textColor = UIColor.rgb(red: 156, green: 156, blue: 156)
    label.textAlignment = .center
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupStackViews()
  }
  
  func setupStackViews() {
    let textStackView = VerticalStackView(arrangedSubviews: [topText, bottomText], spacing: 0)
    let stackView = VerticalStackView(arrangedSubviews: [faceImageView, textStackView], spacing: 20)
    
    addSubview(stackView)
    stackView.fillSuperview()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
