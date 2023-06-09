//
//  DishListTableViewCell.swift
//  FoodsOnline
//
//  Created by Apple on 21.03.23.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    static let identifier = "DishListTableViewCell"
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
    
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        titleLbl.text = order.dish?.name
        descriptionLbl.text = order.name
    }
    
    func setup(category: DishCategory) {
        dishImageView.kf.setImage(with: category.image.asUrl)
        titleLbl.text = category.name
        descriptionLbl.text = ""
    }
}
