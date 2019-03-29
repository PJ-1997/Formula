//
//  TextFieldDelegate.swift
//  Formula
//
//  Created by Pedro on 1/5/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit

extension CalculateController: UITextFieldDelegate {
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    textField.placeholder = ""
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    textField.placeholder = "B"
  }
  
}
