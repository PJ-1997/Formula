//
//  TableView.swift
//  Formula
//
//  Created by Pedro on 12/27/18.
//  Copyright © 2018 Pedro. All rights reserved.
//

import UIKit

extension SearchController: UITableViewDataSource, UITableViewDelegate, CellDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let calculateController = CalculateController()
    let rowIndex = rowsToDisplay[indexPath.row]
    calculateController.calculateStackView.formulaTitle.text = rowIndex.title
    //        calculateController.calculateStackView.formulaImage.image = rowIndex.formulaImage
    navigationController?.pushViewController(calculateController, animated: true)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return rowsToDisplay.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FormulasCell
    let rowsToDisplayIndex = rowsToDisplay[indexPath.row]
    cell.selectionStyle = .none
    cell.delegate = self
    cell.indexPath = indexPath
    cell.formulaName.text = rowsToDisplayIndex.title
    switch segmentedController.selectedSegmentIndex {
    case 0:
      cell.subjectImageView.image = #imageLiteral(resourceName: "MC")
    case 1:
      cell.subjectImageView.image = #imageLiteral(resourceName: "SC")
    default:
      break
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  func didSelectStar(index: IndexPath) {
    guard let cell = tableView.cellForRow(at: index) as? FormulasCell else { return }
    let rowIndex = rowsToDisplay[index.row]
    cell.scaleAnimate(scale: 0.96)
    //Saves to user Defaults
    listOfFormulas.append(rowIndex)
    if let data = try? NSKeyedArchiver.archivedData(withRootObject: listOfFormulas, requiringSecureCoding: false) {
      UserDefaults.standard.set(data, forKey: UserDefaults.favoritedFormulaKey)
    }
    
  }
  
}
