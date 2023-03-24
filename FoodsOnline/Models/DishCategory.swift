//
//  DishCategory.swift
//  FoodsOnline
//
//  Created by Apple on 10.03.23.
//

import Foundation


struct DishCategory: Decodable {
    let id:    String
    let name:  String
    let image: String
//    let dishes: [Dish]
}


struct Restaurants: Decodable {
    let id: String
    let name: String
    let image: String
}
