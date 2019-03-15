//
//  Animations.swift
//  Formula
//
//  Created by Pedro on 3/14/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit

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
    
}

