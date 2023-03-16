//
//  RestaurantCollectionViewCell.swift
//  FoodsOnline
//
//  Created by Apple on 16.03.23.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: RestaurantCollectionViewCell.self)
    
    @IBOutlet weak var RestaurantTitleLbl: UILabel!
    @IBOutlet weak var RestaurantImageView: UIImageView!
    
    
    func setup(restaurant: Restaurants) {
        RestaurantTitleLbl.text = restaurant.name
        
        print("url: \(restaurant.image.asUrl)")
        guard let url = restaurant.image.asUrl else { return }
        RestaurantImageView.kf.setImage(with: url)
    }
}
