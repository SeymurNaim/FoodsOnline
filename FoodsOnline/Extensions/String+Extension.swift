//
//  String+Extension.swift
//  FoodsOnline
//
//  Created by Apple on 16.03.23.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
