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
        .init(id: "id1", name: "Nuxa", image: "https://scontent.fgyd21-1.fna.fbcdn.net/v/t1.6435-9/120254685_958362084667404_1702492172616599635_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=xhUtIqCpyYgAX-ktSzc&_nc_ht=scontent.fgyd21-1.fna&oh=00_AfBrVU3irTsqpeJPMxxQZ1PZ1FtjQMG8JPhJBISSYBvPFw&oe=64428580"),
        .init(id: "id2", name: "CafeCity", image: "https://bakucard.az/wp-content/uploads/2019/07/CC-Wine-Logo-2.png"),
        .init(id: "id3", name: "McDonalds", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/McDonald%27s_logo.svg/1200px-McDonald%27s_logo.svg.png"),
        .init(id: "id4", name: "KFC", image: "https://img.cdn4dd.com/cdn-cgi/image/fit=cover,width=600,height=400,format=auto,quality=80/https://doordash-static.s3.amazonaws.com/media/store/header/3d2fa33c-021c-4373-84e6-16e701030859.4"),
        .init(id: "id5", name: "BurgerKing", image: "https://i.insider.com/5bbd187101145529745a9895?width=700"),
        .init(id: "id6", name: "BirIkiDoner", image: "https://oneclick.az/pics/1000/1000/poi/29289/bir-iki_1437453365.jpg"),
        .init(id: "id7", name: "PechatDoner", image: "https://imageproxy.wolt.com/menu/menu-images/d4c315d8-1a91-11ea-9ea1-0a586469ab49_Pechat_et_lavash.jpeg")
    ]
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Sulu Yeməklər", image: "https://cdn.tarifikolay.com/public/tt/uploads/2020/sebzeli-sulu-kofte_1818-375x281.jpg"),
        .init(id: "id2", name: "Qazan Yeməkləri", image: "https://i.ytimg.com/vi/Pc9g4ienOL8/maxresdefault.jpg"),
        .init(id: "id3", name: "Kabablar", image: "https://cookingcounty.com/wp-content/uploads/2022/04/kabab-torsh-recipe.jpg"),
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
        .init(id: "id6", name: "İmişli Qovurması", description: "Kalorinizi qoruyun", image: "https://azerbaijan.az/uploads/news-files/melumatlar/medeniyyet/Kulinariya/НоваяПапка/gbsisdaLe8U.jpg", calories: 78.0345)
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
        return CGSize(width: 150, height: 200)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }


}
