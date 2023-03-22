//
//  DishPortraitCollectionViewCell.swift
//  FoodsOnline
//
//  Created by Apple on 16.03.23.
//

import UIKit
import Kingfisher

class DishPortraitCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    static let identifier = "DishPortraitCollectionViewCell"
    
    func setup(dish: Dish) {
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLabel.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
    
}
