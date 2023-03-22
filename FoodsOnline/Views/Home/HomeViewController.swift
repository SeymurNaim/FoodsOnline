//
//  HomeViewController.swift
//  FoodsOnline
//
//  Created by Apple on 09.03.23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var specialCollectionView: UICollectionView!
    @IBOutlet weak var restaurantsCollectionView: UICollectionView!
    
    var restaurant: [Restaurants] = [
        .init(id: "id1", name: "Nuxa", image: "https://i.ytimg.com/vi/Pc9g4ienOL8/maxresdefault.jpg"),
        .init(id: "id2", name: "CafeCity", image: "https://i.ytimg.com/vi/Pc9g4ienOL8/maxresdefault.jpg"),
        .init(id: "id3", name: "McDonalds", image: "https://i.ytimg.com/vi/Pc9g4ienOL8/maxresdefault.jpg"),
        .init(id: "id4", name: "KFC", image: "https://i.ytimg.com/vi/Pc9g4ienOL8/maxresdefault.jpg"),
        .init(id: "id5", name: "BurgerKing", image: "https://i.ytimg.com/vi/Pc9g4ienOL8/maxresdefault.jpg"),
        .init(id: "id6", name: "BirIkiDoner", image: "https://i.ytimg.com/vi/Pc9g4ienOL8/maxresdefault.jpg"),
        .init(id: "id7", name: "PechatDoner", image: "https://i.ytimg.com/vi/Pc9g4ienOL8/maxresdefault.jpg")
    ]
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Sulu Yeməklər", image: "https://azerbaijan.az/uploads/news-files/melumatlar/medeniyyet/Kulinariya/НоваяПапка/Azerbajdzhanskij_sup_quotDovgaquot.jpg"),
        .init(id: "id2", name: "Qazan Yeməkləri", image: "https://i.ytimg.com/vi/Pc9g4ienOL8/maxresdefault.jpg"),
        .init(id: "id3", name: "Kabablar", image: "https://azerbaijan.az/uploads/news-files/melumatlar/medeniyyet/Kulinariya/НоваяПапка/sufrem.az-99184.jpg"),
        .init(id: "id4", name: "Tava Yeməkləri", image: "https://i4.hurimg.com/i/hurriyet/75/750x422/622765634e3fe01bfcb3cc0e.jpg"),
        .init(id: "id5", name: "Salatlar", image: "https://img.milli.az/2018/05/07/648714.jpg"),
        .init(id: "id6", name: "Fast Foods", image: "https://img.jakpost.net/c/2016/09/29/2016_09_29_12990_1475116504._large.jpg")
    ]
    
    var specials: [Dish] = [
        .init(id: "id1", name: "Kefli cücə", description: "Kalorinizi qoruyun", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3mblpOEPBzeYrx-bFMfLnNuoA2zudF3qLtQ&usqp=CAU", calories: 34.3834),
        .init(id: "id2", name: "Şah plov", description: "Kalorinizi qoruyun", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCYty_xo-8USyc8cLXVnHU5ucjPkI9bv_YSw&usqp=CAU", calories: 45.1234),
        .init(id: "id3", name: "Special Qovurma", description: "Kalorinizi qoruyun", image: "https://mado.az/uploads/product/89/et-nar-qovurma_1577038290.jpg", calories: 200.5337),
        .init(id: "id4", name: "Santo Mare", description: "Kalorinizi qoruyun", image: "https://www.santomare.com/wp-content/uploads/2018/03/santomare-restaurant2.jpg", calories: 90.9478),
        .init(id: "id5", name: "Şəki Pitisi", description: "Kalorinizi qoruyun", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrgkZL6dG0_3I8CyTJBHBOON_HuO7SWxqP16k9UjR89SQ9YavElFvwKl0qSQGhPJCM1Bo&usqp=CAU", calories: 145.9482),
        .init(id: "id6", name: "İmişli Qovurması", description: "Kalorinizi qoruyun", image: "https://azerbaijan.az/uploads/news-files/melumatlar/medeniyyet/Kulinariya/НоваяПапка/bdc3019683293bb3dbd8ce119225dbf5.jpg", calories: 78.0345)
   ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let service = NetworkService()
//        let request = service.createRequest(route: .temp, method: .post, parameters: ["firsName": "Ilqar", "lastName": "Naim"])
//        print("The URL is: \(request?.url)")
//        print("The body: \(request?.httpBody)")
        
        specialCollectionView.dataSource = self
        specialCollectionView.delegate = self
        
        registerCells()
        
    }
    
    private func registerCells() {
        restaurantsCollectionView.register(UINib(nibName: RestaurantCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RestaurantCollectionViewCell.identifier)
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        specialCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case specialCollectionView:
            return specials.count
        case restaurantsCollectionView:
            return restaurant.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
            
        case specialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
            
        case restaurantsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCollectionViewCell.identifier, for: indexPath) as! RestaurantCollectionViewCell
            cell.setup(restaurant: restaurant[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 120)
    }
    
    
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if collectionView == categoryCollectionView {
//            let controller = ListDishesViewController.instantiate()
//            controller.category = categories[indexPath.row]
//            navigationController?.pushViewController(controller, animated: true)
//        } else {
//            let controller = DishDetailViewController.instantiate()
//            controller.dish = collectionView == categoryCollectionView ? categories[indexPath.row] : specials[indexPath.row]
//            navigationController?.pushViewController(controller, animated: true)
//        }
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instantiate()
            let dish = specials[indexPath.row]
            controller.dish = dish
            navigationController?.pushViewController(controller, animated: true)
        }
    }


}
