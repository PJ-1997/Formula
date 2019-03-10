import Foundation
import UIKit

extension UIView {
    func setCollectionCellShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 3.5)
        self.layer.shadowOpacity = 0.05
    }
    //FIXME: Aff Cgpath to shadow properly
    func setTableCellShadow() {
        //        self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = 3
    }
}

extension UISegmentedControl {
    func style() {
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.tintColor = UIColor.blueFormula
        self.selectedSegmentIndex = 0
        self.setTitleTextAttributes([NSAttributedString.Key.font: Theme.fonts.fontFormulaBold(size: 14) as Any], for: .normal)
    }
}

extension UITextField {
    func styleTextField() {
        self.textAlignment = .center
        self.keyboardType = .decimalPad
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.placeholder = "A"
    }
}

