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
      if subjectLabel.text == "Math" {
        subjectImageView.image = #imageLiteral(resourceName: "MathIcon")
        backgroundColorView.backgroundColor = UIColor.cellBlue
      } else {
        subjectImageView.image = #imageLiteral(resourceName: "SciencIcon")
        backgroundColorView.backgroundColor = UIColor.cellGreen
      }
    }
  }
  
  let subjectImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  let backgroundColorView: UIView = {
    let view = UIView()
    view.clipsToBounds = true
    view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    view.layer.cornerRadius = 15
    return view
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
    backgroundColorView.translatesAutoresizingMaskIntoConstraints = false
    backgroundColorView.addSubview(subjectImageView)
    [backgroundColorView, labelStackView].forEach({addSubview($0)})
    
    backgroundColorView.anchor(top: topAnchor, leading: labelStackView.leadingAnchor, bottom: labelStackView.topAnchor, trailing: labelStackView.trailingAnchor)
    backgroundColorView.heightAnchor.constraint(equalTo: backgroundColorView.widthAnchor).isActive = true
    labelStackView.anchor(top: backgroundColorView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
    labelStackView.heightAnchor.constraint(equalTo: backgroundColorView.heightAnchor, multiplier: 0.30).isActive = true
    
    subjectImageView.centerXAnchor.constraint(equalTo: backgroundColorView.centerXAnchor).isActive = true
    subjectImageView.centerYAnchor.constraint(equalTo: backgroundColorView.centerYAnchor).isActive = true
    subjectImageView.widthAnchor.constraint(equalTo: backgroundColorView.widthAnchor, multiplier: 0.70).isActive = true

    nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

