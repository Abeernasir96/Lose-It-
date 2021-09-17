//
//  CalculatorBrain.swift
//  Lose It!
//
//  Created by Abeer Nasir on 09/09/2021.
//

import UIKit

struct CalculatorBrain {
    
    var calories: Calories!
    
    func getCaloriesValue() -> String {
        let caloriesTo1DecimalPlace = String(format: "%.0f", calories?.value ?? 0.0)
        return caloriesTo1DecimalPlace
    }
    mutating func calculateCalories(height: Float, weight: Float, age: Float) {
        let caloriesValue = ((6.5 * height) + (10 * weight)) + (5 * age)
        calories = Calories(value: caloriesValue)
        
}
}
