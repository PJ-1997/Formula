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
  
  //MARK:- Logic
  //Math
  func areaofSquare(num: Float?) -> String {
    var ans: Float!
    if num == nil {
      return "Put value in"
    } else if num! <= 0 {
      return "No real Solution"
    } else {
      ans = powf(num!, 2)
      let round = (ans * 100).rounded()/100
      ans = round
      return "Area = \(ans!)"
    }
  }
  
  func areaofCircle(num: Float?) -> String {
    var ans: Float!
    if num == nil {
      return "Put value in"
    } else if num! <= 0 {
      return "No real Solution"
    } else {
      let pi = (Float.pi)
      ans = powf(num!, 2) * pi
      let round = (ans * 1000).rounded()/1000
      ans = round
      return "Area = \(ans!)"
    }
  }
  
  func areaofTrapizoid(num1: Float?, num2: Float?, num3: Float?) -> String {
    var ans: Float!
    if num1 == nil || num2 == nil || num3 == nil{
      return "Fill all boxes"
    } else if num1! <= 0 || num2! <= 0 || num3! <= 0 {
      return "No real Solution"
    } else {
      let base = num1! + num2!
      let times = base * num3!
      ans = times * 0.5
      let round = (ans * 1000).rounded()/1000
      ans = round
      return "Area = \(ans!)"
    }
  }
  
  func areaofRectangle(num1: Float?, num2: Float?) -> String {
    var ans: Float!
    if num1 == nil || num2 == nil {
      return "Fill all boxes"
    } else if num1! <= 0 || num2! <= 0 {
      return "No real Solution"
    } else {
      ans = num1! * num2!
      let round = (ans * 1000).rounded()/1000
      ans = round
      return "Area = \(ans!)"
    }
  }
  
  //Science
  //TODO:- Fix Science Formulas
  func densityFormula(density: Float?, mass: Float?, volume: Float?) -> String {
    var ans: Float!
    if (density != nil && mass != nil && volume != nil) {
      return "Leave one box empty"
    } else if (mass != nil && volume != nil) {
      if (mass! <= 0 || volume! <= 0) {
        return "No real Solution"
      }
      ans = mass! / volume!
      print("Density is Empty")
      return "Density = \(ans!)"
    } else if (density != nil && volume != nil) {
      if (density! <= 0 || volume! <= 0) {
        return "No real Solution"
      }
      ans = volume! * density!
      print("Mass is Empty")
      return "Mass = \(ans!)"
    } else if (mass != nil && density != nil) {
      if (mass! <= 0 || density! <= 0) {
        return "No real Solution"
      }
      ans = mass! * density!
      print("Volume is Empty")
      return "Volume = \(ans!)"
    } else if density == nil || mass == nil || volume == nil {
      return "Leave one box empty"
    }
    return "No real Solution"
  }
  
  func speedFormula(speed: Float?, distance: Float?, time: Float?) -> String {
    var ans: Float!
    if (speed != nil && distance != nil && time != nil) {
      return "Leave one box empty"
    } else if (distance != nil && time != nil) {
      if (distance! <= 0 || time! <= 0) {
        return "No real Solution"
      }
      ans = distance! / time!
      print("Speed is Empty")
      return "Speed = \(ans!)"
    } else if (speed != nil && time != nil) {
      if (speed! <= 0 || time! <= 0) {
        return "No real Solution"
      }
      ans = time! * speed!
      print("Distance is Empty")
      return "Distance = \(ans!)"
    } else if (distance != nil && speed != nil) {
      if (distance! <= 0 || speed! <= 0) {
        return "No real Solution"
      }
      ans = distance! * speed!
      print("Time is Empty")
      return "Time = \(ans!)"
    } else if speed == nil || distance == nil || time == nil {
      return "Leave one box empty"
    }
    return "No real Solution"
  }
  
  func momentumFormula(momentum: Float?, mass: Float?, velocity: Float?) -> String {
    var ans: Float!
    if (momentum != nil && mass != nil && velocity != nil) {
      return "Leave one box empty"
    } else if (mass != nil && velocity != nil) {
      if (mass! <= 0 || velocity! <= 0) {
        return "No real Solution"
      }
      ans = mass! * velocity!
      print("Momentum is Empty")
      return "Momentum = \(ans!)"
    } else if (momentum != nil && velocity != nil) {
      if (momentum! <= 0 || velocity! <= 0) {
        return "No real Solution"
      }
      ans = momentum! / velocity!
      print("Mass is Empty")
      return "Mass = \(ans!)"
    } else if (mass != nil && momentum != nil) {
      if (mass! <= 0 || momentum! <= 0) {
        return "No real Solution"
      }
      ans = momentum! / mass!
      print("Velocity is Empty")
      return "Velocity = \(ans!)"
    } else if momentum == nil || mass == nil || velocity == nil {
      return "Leave one box empty"
    }
    return "No real Solution"
  }
  
  func forceFormula(force: Float?, mass: Float?, acceleration: Float?) -> String {
    var ans: Float!
    if (force != nil && mass != nil && acceleration != nil) {
      return "Leave one box empty"
    } else if (mass != nil && acceleration != nil) {
      if (mass! <= 0 || acceleration! <= 0) {
        return "No real Solution"
      }
      ans = mass! * acceleration!
      print("Force is Empty")
      return "Force = \(ans!)"
    } else if (force != nil && acceleration != nil) {
      if (force! <= 0 || acceleration! <= 0) {
        return "No real Solution"
      }
      ans = force! / acceleration!
      print("Mass is Empty")
      return "Mass = \(ans!)"
    } else if (mass != nil && force != nil) {
      if (mass! <= 0 || force! <= 0) {
        return "No real Solution"
      }
      ans = force! / mass!
      print("Acceleration is Empty")
      return "Acceleration = \(ans!)"
    } else if force == nil || mass == nil || acceleration == nil {
      return "Leave one box empty"
    }
    return "No real Solution"
  }
  
}
