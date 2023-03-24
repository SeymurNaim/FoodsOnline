//
//  AllDishes.swift
//  FoodsOnline
//
//  Created by Apple on 23.03.23.
//

import Foundation


struct AllDishes: Decodable {
    let restaurants: [Restaurants]?
    let categories: [DishCategory]?
    let specials: [Dish]?
}
