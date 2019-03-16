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
        let mathRow = mathFormulas[indexPath.row]
        let scienceRow = scienceFormulas[indexPath.row]
        switch segmentedController.selectedSegmentIndex {
        case 0:
            calculateController.calculateStackView.formulaTitle.text = mathRow.title
            calculateController.calculateStackView.formulaImage.image = mathRow.formulaImage
            //FIXME: Refactor this switch case
            switch mathRow.title {
            case "Area of Square":
                calculateController.calculateStackView.middleTextField.removeFromSuperview()
                calculateController.calculateStackView.rightTextField.removeFromSuperview()
            case "Area of Circle":
                calculateController.calculateStackView.middleTextField.removeFromSuperview()
                calculateController.calculateStackView.rightTextField.removeFromSuperview()
            case "Area of a Trapizoid":
                print("area of trap")
            case "Area of Rectangle":
                calculateController.calculateStackView.rightTextField.removeFromSuperview()
            default:
                break
            }
//            if let sameForm = favoritedFormulas.filter({ $0.title == mathRow.title }).first {
//                print("Has same in FF and SearchCon.: \(sameForm.title)")
//                if sameForm.title == "Area of Square" {
//                    print("This is correct")
//                    calculateController.calculateStackView.middleTextField.removeFromSuperview()
//                    calculateController.calculateStackView.rightTextField.removeFromSuperview()
//                }
//            }
        case 1:
            calculateController.calculateStackView.formulaTitle.text = scienceRow.title
            calculateController.calculateStackView.formulaImage.image = scienceRow.formulaImage
            switch scienceRow.title {
            case "Density":
                print(scienceRow.title)
            case "Speed":
                print(scienceRow.title)
            case "Momentum":
                print(scienceRow.title)
            case "Force":
                print(scienceRow.title)
            default:
                break
            }
        default:
            break
        }
        navigationController?.pushViewController(calculateController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = 0
        switch segmentedController.selectedSegmentIndex {
        case 0:
            returnValue = mathFormulas.count
        case 1:
            returnValue = scienceFormulas.count
        default:
            break
        }
        return returnValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FormulasCell
        cell.selectionStyle = .none
        cell.delegate = self
        cell.indexPath = indexPath
        switch segmentedController.selectedSegmentIndex {
        case 0:
            let math = self.mathFormulas[indexPath.row]
            cell.formulaName.text = math.title
            cell.subjectImageView.image = #imageLiteral(resourceName: "metallica")
        case 1:
            let science = self.scienceFormulas[indexPath.row]
            cell.formulaName.text = science.title
            cell.subjectImageView.image = #imageLiteral(resourceName: "nirvana")
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
        cell.scaleAnimate(scale: 0.96)
        //Saves to user Defaults
        let mathIndex = mathFormulas[index.row]
        let scienceIndex = scienceFormulas[index.row]
        
        switch segmentedController.selectedSegmentIndex {
        case 0:
            listOfFormulas.append(mathIndex)
            if let mathData = try? NSKeyedArchiver.archivedData(withRootObject: listOfFormulas, requiringSecureCoding: false) {
                UserDefaults.standard.set(mathData, forKey: UserDefaults.favoritedFormulaKey)
            }
        case 1:
            listOfFormulas.append(scienceIndex)
            if let scienceData = try? NSKeyedArchiver.archivedData(withRootObject: listOfFormulas, requiringSecureCoding: false) {
                UserDefaults.standard.set(scienceData, forKey: UserDefaults.favoritedFormulaKey)
            }
        default:
            break
        }
    }
    
}
