//
//  Dish.swift
//  FoodsOnline
//
//  Created by Apple on 16.03.23.
//

import Foundation


struct Dish: Decodable {
    let id, name, description, image: String?
    let calories: Double?
    
    var formattedCalories: String {
        return String(format: "%.2f calories", calories ?? 0)
    }
}
