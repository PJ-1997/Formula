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
    aCoder.encode(title, forKey: "titleKey")
    aCoder.encode(type, forKey: "typeKey")
    aCoder.encode(isFavorited, forKey: "isFavKey")
  }
  
  required init?(coder aDecoder: NSCoder) {
    title = aDecoder.decodeObject(forKey: "titleKey") as! String
    type = aDecoder.decodeObject(forKey: "typeKey") as! String
    isFavorited = aDecoder.decodeBool(forKey: "isFavKey")
  }
  
  //TODO: Change the UIimage not optional
  var title: String
  var type: String
  var cellImage: UIImage?
  var formulaImage: UIImage?
  var isFavorited: Bool
  
  init(title: String, type: String, cellImage: UIImage?, formulaImage: UIImage?, isFav: Bool) {
    self.title = title
    self.type = type
    self.cellImage = cellImage
    self.formulaImage = formulaImage
    self.isFavorited = isFav
  }
  
}
