//
//  Route.swift
//  FoodsOnline
//
//  Created by Apple on 22.03.23.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case temp
    
    var description: String {
        switch self {
        case .temp: return "/temp"
        }
    }
}
