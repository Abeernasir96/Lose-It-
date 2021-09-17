//
//  CalorieModel.swift
//  Lose It!
//
//  Created by Abeer Nasir on 12/09/2021.
//

import Foundation

struct CalorieModel{
    let nfCals : Double
    let item : String
    
    var CalorieString: String{
        return String(format: "%.0f", nfCals)
    }
}
