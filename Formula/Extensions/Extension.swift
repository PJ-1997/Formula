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
  
  func setTableCellShadow() {
    self.layer.masksToBounds = false
    self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOffset = CGSize(width: 0, height: 0)
    self.layer.shadowOpacity = 0.2
    self.layer.shadowRadius = 1.3
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
    if UIDevice.current.screenType == .iPhone_XSMax || UIDevice.current.screenType == .iPhones_6Plus_6sPlus_7Plus_8Plus {
      self.setTitleTextAttributes([NSAttributedString.Key.font: Theme.fonts.fontFormulaBold(size: 15) as Any], for: .normal)
    } else if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
      self.setTitleTextAttributes([NSAttributedString.Key.font: Theme.fonts.fontFormulaBold(size: 13) as Any], for: .normal)
    } else {
      self.setTitleTextAttributes([NSAttributedString.Key.font: Theme.fonts.fontFormulaBold(size: 14) as Any], for: .normal)
    }
    
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

//MARK:- UIDevice
extension UIDevice {
  var iPhoneX: Bool {
    return UIScreen.main.nativeBounds.height == 2436
  }
  var iPhone: Bool {
    return UIDevice.current.userInterfaceIdiom == .phone
  }
  enum ScreenType: String {
    case iPhones_4_4S = "iPhone 4 or iPhone 4S"
    case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
    case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
    case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
    case iPhones_X_XS = "iPhone X or iPhone XS"
    case iPhone_XR = "iPhone XR"
    case iPhone_XSMax = "iPhone XS Max"
    case unknown
  }
  var screenType: ScreenType {
    switch UIScreen.main.nativeBounds.height {
    case 960:
      return .iPhones_4_4S
    case 1136:
      return .iPhones_5_5s_5c_SE
    case 1334:
      return .iPhones_6_6s_7_8
    case 1792:
      return .iPhone_XR
    case 1920, 2208:
      return .iPhones_6Plus_6sPlus_7Plus_8Plus
    case 2436:
      return .iPhones_X_XS
    case 2688:
      return .iPhone_XSMax
    default:
      return .unknown
    }
  }
}

