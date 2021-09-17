//
//  CalorieData.swift
//  Lose It!
//
//  Created by Abeer Nasir on 12/09/2021.
//

import Foundation

struct CalorieData: Codable{
    let hits: [Hits]
}

struct Hits: Codable {
    let fields: Fields
}

struct Fields: Codable {
    let nf_calories : Double
    let item_name : String
}
