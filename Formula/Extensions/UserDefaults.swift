//
//  UserDefaults.swift
//  Formula
//
//  Created by Pedro on 3/1/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static let favoritedFormulaKey = "favoritedFormulaKey"
    
    func savedFormulas() -> [FormulaModel] {
        guard let savedFormulasData = UserDefaults.standard.object(forKey: UserDefaults.favoritedFormulaKey) as? Data else { return [] }
        guard let decodeFormula = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedFormulasData) as? [FormulaModel] else { return [] }
        return decodeFormula ?? [FormulaModel]()
        
    }
    
    func deleteFormula(formula: FormulaModel) {
        let formulas = savedFormulas()
        let filteredFormulas = formulas.filter { (f) -> Bool in
            return f.title != formula.title && f.type != formula.type
        }
        let data = try? NSKeyedArchiver.archivedData(withRootObject: filteredFormulas, requiringSecureCoding: false)
        UserDefaults.standard.set(data, forKey: UserDefaults.favoritedFormulaKey)
    }
}


