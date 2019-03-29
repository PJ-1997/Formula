//
//  SubjectsCell.swift
//  Formula
//
//  Created by Pedro on 12/26/18.
//  Copyright © 2018 Pedro. All rights reserved.
//

import UIKit

class SubjectsCell: UICollectionViewCell {
  
  var formula: FormulaModel! {
    didSet {
      subjectLabel.text = formula.title
    }
  }
  
  let imageView: UIImageView = {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "Geo"))
    imageView.clipsToBounds = true
    imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    imageView.layer.cornerRadius = 15
    return imageView
  }()
  
  let subjectLabel: UILabel = {
    let label = UILabel()
    label.text = "Subject Name"
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let recentLabel: UILabel = {
    let label = UILabel()
    label.text = "Recently used: 2"
    label.font = UIFont.systemFont(ofSize: 14)
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupCell()
    setupViews()
  }
  
  fileprivate func setupCell() {
    backgroundColor = .white
    layer.cornerRadius = 15
    self.setCollectionCellShadow()
  }
  
  fileprivate func setupViews() {
    let stackView = UIStackView(arrangedSubviews: [subjectLabel, recentLabel])
    stackView.axis = .vertical
    stackView.layoutMargins = UIEdgeInsets(top: 6, left: 8, bottom: 8, right: 0)
    stackView.isLayoutMarginsRelativeArrangement = true
    
    //Enables auto layout
    stackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(imageView)
    addSubview(stackView)
    
    imageView.anchor(top: topAnchor, leading: stackView.leadingAnchor, bottom: stackView.topAnchor, trailing: stackView.trailingAnchor)
    imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
    stackView.anchor(top: imageView.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    recentLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

