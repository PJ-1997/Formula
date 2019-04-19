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
      nameLabel.text = formula.title
      subjectLabel.text = formula.type
    }
  }
  
  let imageView: UIImageView = {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "Geo"))
    imageView.clipsToBounds = true
    imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    imageView.layer.cornerRadius = 15
    return imageView
  }()
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.text = "Subject Name"
    if UIDevice.current.screenType == .iPhone_XSMax || UIDevice.current.screenType == .iPhones_6Plus_6sPlus_7Plus_8Plus {
      label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    } else if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
      label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    } else {
      label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    label.translatesAutoresizingMaskIntoConstraints = false
    label.adjustsFontSizeToFitWidth = true
    return label
  }()
  
  let subjectLabel: UILabel = {
    let label = UILabel()
    label.text = ""
    if UIDevice.current.screenType == .iPhone_XSMax || UIDevice.current.screenType == .iPhones_6Plus_6sPlus_7Plus_8Plus {
      label.font = UIFont.systemFont(ofSize: 15)
    } else if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
      label.font = UIFont.systemFont(ofSize: 13)
    } else {
      label.font = UIFont.systemFont(ofSize: 14)
    }
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
    let labelStackView = UIStackView(arrangedSubviews: [nameLabel, subjectLabel])
    labelStackView.axis = .vertical
    if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
      labelStackView.layoutMargins = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
    } else {
      labelStackView.layoutMargins = UIEdgeInsets(top: 2, left: 8, bottom: 12, right: 8)
    }
    labelStackView.isLayoutMarginsRelativeArrangement = true
    
    //Enables auto layout
    labelStackView.translatesAutoresizingMaskIntoConstraints = false
    [imageView, labelStackView].forEach({addSubview($0)})
    
    imageView.anchor(top: topAnchor, leading: labelStackView.leadingAnchor, bottom: labelStackView.topAnchor, trailing: labelStackView.trailingAnchor)
    imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
    labelStackView.anchor(top: imageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
    labelStackView.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.30).isActive = true
    nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

