//
//  FormulasCell.swift
//  Formula
//
//  Created by Pedro on 12/28/18.
//  Copyright © 2018 Pedro. All rights reserved.
//

import UIKit

protocol CellDelegate {
  func didSelectStar(index: IndexPath)
}

class FormulasCell: UITableViewCell {
  
  var delegate: CellDelegate?
  var indexPath: IndexPath!
  
  let cellView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    view.setTableCellShadow()
    return view
  }()
  
  let formulaName: UILabel = {
    let label = UILabel()
    label.text = "Formula Name"
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.textColor = UIColor.darkGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let subjectImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  lazy var buttonStar: UIButton = {
    let button = UIButton()
    button.setImage( #imageLiteral(resourceName: "GrayStar") , for: .normal)
    button.tintColor = UIColor.greyFormula
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(handleFavoritedStar), for: .touchUpInside)
    return button
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }
  
  fileprivate func setup() {
    backgroundColor = UIColor.greyFormula
    addSubview(cellView)
    cellView.addSubview(subjectImageView)
    cellView.addSubview(formulaName)
    cellView.addSubview(buttonStar)
    
    cellView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 4, left: 8, bottom: 4, right: 8))
    
    subjectImageView.anchor(top: nil, leading: cellView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 8), size: .init(width: 40, height: 40))
    subjectImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
    
    formulaName.anchor(top: nil, leading: subjectImageView.trailingAnchor, bottom: nil, trailing: buttonStar.leadingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    formulaName.centerYAnchor.constraint(equalTo: subjectImageView.centerYAnchor).isActive = true
    formulaName.heightAnchor.constraint(equalToConstant: 40)
    
    buttonStar.anchor(top: nil, leading: nil, bottom: nil, trailing: cellView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10), size: .init(width: 30, height: 30))
    buttonStar.centerYAnchor.constraint(equalTo: formulaName.centerYAnchor).isActive = true
  }
  
  @objc func handleFavoritedStar(sender: UIButton) {
    delegate?.didSelectStar(index: indexPath)
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.delegate = nil
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
