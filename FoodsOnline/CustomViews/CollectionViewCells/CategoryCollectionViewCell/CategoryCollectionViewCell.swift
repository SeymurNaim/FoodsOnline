//
//  CategoryCollectionViewCell.swift
//  FoodsOnline
//
//  Created by Apple on 10.03.23.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)

  
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    func setup(category: DishCategory) {
        categoryTitleLbl.text = category.name
        
        guard let url = URL(string: category.image) else { return }
        print("url: \(url)")
        categoryImageView.kf.setImage(with: url)
    }
}
