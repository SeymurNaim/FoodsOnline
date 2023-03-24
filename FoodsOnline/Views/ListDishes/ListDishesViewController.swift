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
        var dishes = [Dish]()
    
    
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
    
    
    func dishesJsonRead() {
        if let jsonFile = Bundle.main.url(forResource: "Dishes", withExtension: "json"),
           let data = try? Data(contentsOf: jsonFile) {
            do {
                dishes = try JSONDecoder().decode([Dish].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("File not found")
        }
    }
    
    

    
}

