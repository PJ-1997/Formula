//
//  Formulas.swift
//  Formula
//
//  Created by Pedro on 3/17/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit

class Formulas {
  
  static let shared = Formulas()
  
  func addMathFormulas() -> [FormulaModel] {
    var mathForm: [FormulaModel] = []
    let squared = FormulaModel(title: "Area of Square", type: "Math", cellImage: nil, formulaImage: #imageLiteral(resourceName: "SquareRoot"), isFav: false)
    let circle = FormulaModel(title: "Area of Circle", type: "Math", cellImage: nil, formulaImage: #imageLiteral(resourceName: "Circle"), isFav: false)
    let trapizoid = FormulaModel(title: "Area of a Trapizoid", type: "Math", cellImage: nil, formulaImage: #imageLiteral(resourceName: "Trap"), isFav: false)
    let rectangle = FormulaModel(title: "Area of Rectangle", type: "Math", cellImage: nil, formulaImage: #imageLiteral(resourceName: "Rect"), isFav: false)
    //        let rectangle0 = FormulaModel(title: "Area of Rectangle", type: "Math", cellImage: nil, formulaImage: #imageLiteral(resourceName: "Rect"))
    //        let rectangle1 = FormulaModel(title: "Area ", type: "Math", cellImage: nil, formulaImage: #imageLiteral(resourceName: "Rect"))
    //        let rectangle2 = FormulaModel(title: "Area of ", type: "Math", cellImage: nil, formulaImage: #imageLiteral(resourceName: "Rect"))
    //        let rectangle3 = FormulaModel(title: " of Rectangle", type: "Math", cellImage: nil, formulaImage: #imageLiteral(resourceName: "Rect"))
    //        let rectangle4 = FormulaModel(title: "Area  Rectangle", type: "Math", cellImage: nil, formulaImage: #imageLiteral(resourceName: "Rect"))
    //        let rectangle5 = FormulaModel(title: "Area of ", type: "Math", cellImage: nil, formulaImage: #imageLiteral(resourceName: "Rect"))
    //        mathForm += [squared, circle, trapizoid, rectangle, rectangle0 ,rectangle1, rectangle2, rectangle3, rectangle4, rectangle5]
    mathForm += [squared, circle, trapizoid, rectangle]
    return mathForm
  }
  
  func addScienceFormulas() -> [FormulaModel] {
    var scienceForm: [FormulaModel] = []
    let density = FormulaModel(title: "Density", type: "Science", cellImage: nil, formulaImage: #imageLiteral(resourceName: "Density"), isFav: false)
    let speed = FormulaModel(title: "Speed", type: "Science", cellImage: nil, formulaImage: #imageLiteral(resourceName: "Speed"), isFav: false)
    let momentum = FormulaModel(title: "Momentum", type: "Science", cellImage: nil, formulaImage: #imageLiteral(resourceName: "Mom"), isFav: false)
    let force = FormulaModel(title: "Force", type: "Science", cellImage: nil, formulaImage: #imageLiteral(resourceName: "Force"), isFav: false)
    scienceForm += [density, speed, momentum, force]
    return scienceForm
  }
  
}
