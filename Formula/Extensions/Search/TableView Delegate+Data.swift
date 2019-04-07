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
    
    let mapRowsToDisplay = rowsToDisplay.map({$0.title})
    let mapListOfFormulas = listOfFormulas.map({$0.title})
    let hasFavorited = mapRowsToDisplay.filter({mapListOfFormulas.contains($0)})
    
    //Favorite Star Logic
    if hasFavorited.contains(rowsToDisplayIndex.title) {
      cell.buttonStar.setImage(#imageLiteral(resourceName: "YellowStar"), for: .normal)
      rowsToDisplayIndex.isFavorited = true
    } else {
      cell.buttonStar.setImage(#imageLiteral(resourceName: "GrayStar"), for: .normal)
      rowsToDisplayIndex.isFavorited = false
    }
    
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
    
    let hasFavorited = rowIndex.isFavorited
    rowIndex.isFavorited = !hasFavorited
    //Favorite Star Pressed Logic
    if hasFavorited == true {
      cell.buttonStar.setImage(#imageLiteral(resourceName: "GrayStar"), for: .normal)
      UserDefaults.standard.deleteFormula(formula: rowIndex)
    } else {
      cell.buttonStar.setImage(#imageLiteral(resourceName: "YellowStar"), for: .normal)
      //Saves to user Defaults
      listOfFormulas.append(rowIndex)
      if let data = try? NSKeyedArchiver.archivedData(withRootObject: listOfFormulas, requiringSecureCoding: false) {
        UserDefaults.standard.set(data, forKey: UserDefaults.favoritedFormulaKey)
      }
    }
  }
  
}
