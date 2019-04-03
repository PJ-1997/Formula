import Foundation
import UIKit

//MARK:- UIView
extension UIView {
  
  func scaleAnimate(scale: CGFloat) {
    UIView.animate(withDuration: 0.22, delay: 0, options: .curveEaseInOut, animations: {
      self.transform = CGAffineTransform(scaleX: scale, y: scale)
    }) { (_) in
      UIView.animate(withDuration: 0.60, delay: 0, usingSpringWithDamping: 0.37, initialSpringVelocity: 20, options: .curveEaseInOut, animations: {
        self.transform = CGAffineTransform.identity
      })
    }
  }
  
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

//MARK:- UISegmentedControl
extension UISegmentedControl {
  func style() {
    self.backgroundColor = .white
    self.translatesAutoresizingMaskIntoConstraints = false
    self.tintColor = UIColor.blueFormula
    self.selectedSegmentIndex = 0
    self.setTitleTextAttributes([NSAttributedString.Key.font: Theme.fonts.fontFormulaBold(size: 14) as Any], for: .normal)
  }
}

//MARK:- UITextField
extension UITextField {
  func styleTextField() {
    self.textAlignment = .center
    self.keyboardType = .decimalPad
    self.layer.cornerRadius = 5
    self.layer.borderColor = UIColor.lightGray.cgColor
    self.layer.borderWidth = 1
  }
}

//MARK:- UIViewController
extension UIViewController {
  func hideKeyboard() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
}

//MARK:- UILabel
extension UILabel {
  convenience init(text: String) {
    self.init(frame: .zero)
    self.text = text
    self.font = UIFont.systemFont(ofSize: 15)
    self.numberOfLines = 0
    self.minimumScaleFactor = 0.5
    self.adjustsFontSizeToFitWidth = true
  }
}

//MARK:- UIImageView
extension UIImageView {
  convenience init(image: UIImage, insets: CGFloat) {
    self.init(image: nil)
    let insets: CGFloat = insets
    self.image = image.withAlignmentRectInsets(UIEdgeInsets(top: insets, left: insets, bottom: insets, right: insets))
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}

//MARK:- UserDefaults
extension UserDefaults {
  
  static let favoritedFormulaKey = "favoritedFormulaKey"
  
  func savedFormulas() -> [FormulaModel] {
    guard let savedFormulasData = UserDefaults.standard.object(forKey: UserDefaults.favoritedFormulaKey) as? Data else { return [] }
    guard let decodeFormula = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedFormulasData) as? [FormulaModel] else { return [] }
    return decodeFormula!
  }
  
  func deleteFormula(formula: FormulaModel) {
    let formulas = savedFormulas()
    let filteredFormulas = formulas.filter { (f) -> Bool in
      return f.title != formula.title
    }
    let data = try? NSKeyedArchiver.archivedData(withRootObject: filteredFormulas, requiringSecureCoding: false)
    UserDefaults.standard.set(data, forKey: UserDefaults.favoritedFormulaKey)
  }
}

