//
//  UiView+Extensions.swift
//  FoodsOnline
//
//  Created by Apple on 08.03.23.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}


