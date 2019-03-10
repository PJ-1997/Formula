//
//  FormulaModel.swift
//  Formula
//
//  Created by Pedro on 12/30/18.
//  Copyright © 2018 Pedro. All rights reserved.
//

import UIKit

class FormulaModel: NSObject, NSCoding {
    
    func encode(with aCoder: NSCoder) {
//        print("Trying to transform Formula into Data")
        aCoder.encode(title, forKey: "titleKey")
        aCoder.encode(type, forKey: "typeKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
//        print("Trying to turn Data into FormulaModel Object")
        title = aDecoder.decodeObject(forKey: "titleKey") as! String
        type = aDecoder.decodeObject(forKey: "typeKey") as! String
    }
    
    //TODO: Change the UIimage not optional
    var title: String
    var type: String
    var cellImage: UIImage?
    var formulaImage: UIImage?
    
    init(title: String, type: String, cellImage: UIImage?, formulaImage: UIImage?) {
        self.title = title
        self.type = type
        self.cellImage = cellImage
        self.formulaImage = formulaImage
    }
    
}
