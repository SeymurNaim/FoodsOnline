//
//  OnboardingSlide.swift
//  FoodsOnline
//
//  Created by Apple on 08.03.23.
//

import UIKit

struct OnboardingSlide: Equatable {
    let title:       String
    let description: String
    let image:       UIImage
    
    static func == (lhs: OnboardingSlide, rhs: OnboardingSlide) -> Bool {
        return lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.image == rhs.image
    }
}
