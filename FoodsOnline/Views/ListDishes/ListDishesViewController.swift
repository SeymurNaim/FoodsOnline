//
//  ListDishesViewController.swift
//  FoodsOnline
//
//  Created by Apple on 21.03.23.
//

import UIKit

class ListDishesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    var dishes: [Dish] = [
        .init(id: "id1", name: "Kefli cücə", description: "Kalorinizi qoruyun", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3mblpOEPBzeYrx-bFMfLnNuoA2zudF3qLtQ&usqp=CAU", calories: 34.3834),
        .init(id: "id2", name: "Şah plov", description: "Kalorinizi qoruyun", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCYty_xo-8USyc8cLXVnHU5ucjPkI9bv_YSw&usqp=CAU", calories: 45.1234),
        .init(id: "id3", name: "Special Qovurma", description: "Kalorinizi qoruyun", image: "https://mado.az/uploads/product/89/et-nar-qovurma_1577038290.jpg", calories: 200.5337),
        .init(id: "id4", name: "Santo Mare", description: "Kalorinizi qoruyun", image: "https://www.santomare.com/wp-content/uploads/2018/03/santomare-restaurant2.jpg", calories: 90.9478),
        .init(id: "id5", name: "Şəki Pitisi", description: "Kalorinizi qoruyun", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrgkZL6dG0_3I8CyTJBHBOON_HuO7SWxqP16k9UjR89SQ9YavElFvwKl0qSQGhPJCM1Bo&usqp=CAU", calories: 145.9482),
        .init(id: "id6", name: "İmişli Qovurması", description: "Kalorinizi qoruyun", image: "https://azerbaijan.az/uploads/news-files/melumatlar/medeniyyet/Kulinariya/НоваяПапка/gbsisdaLe8U.jpg", calories: 78.0345)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = category.name
        registerCells()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }

}


extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
