//
//  Theme.swift
//  Formula
//
//  Created by Pedro on 12/27/18.
//  Copyright © 2018 Pedro. All rights reserved.
//

import UIKit

class Theme {
    class fonts {
        class func fontFormulaBold(size: CGFloat) -> UIFont {
            return UIFont(name: "AvenirNext-Bold", size: size)!
        }
    }
}


extension UIColor {
    static let blueFormula = UIColor.rgb(red: 88, green: 135, blue: 249)
    static let greyFormula = UIColor.rgb(red: 245, green: 245, blue: 245)
    
    static let gradientDarkBlue = UIColor.rgb(red: 84, green: 114, blue: 255)
    static let gradientLightBlue = UIColor.rgb(red: 58, green: 192, blue: 255)
}
