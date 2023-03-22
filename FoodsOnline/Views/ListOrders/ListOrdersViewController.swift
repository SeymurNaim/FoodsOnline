//
//  ListOrdersViewController.swift
//  FoodsOnline
//
//  Created by Apple on 22.03.23.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "id", name: "Seymur", dish: .init(id: "id1", name: "Kefli cücə", description: "Kalorinizi qoruyun", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3mblpOEPBzeYrx-bFMfLnNuoA2zudF3qLtQ&usqp=CAU", calories: 34.3834)),
        .init(id: "id", name: "Araz", dish: .init(id: "id1", name: "Kefli cücə", description: "Kalorinizi qoruyun", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3mblpOEPBzeYrx-bFMfLnNuoA2zudF3qLtQ&usqp=CAU", calories: 34.3834)),
        .init(id: "id", name: "Xelil", dish: .init(id: "id1", name: "Kefli cücə", description: "Kalorinizi qoruyun", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3mblpOEPBzeYrx-bFMfLnNuoA2zudF3qLtQ&usqp=CAU", calories: 34.3834)),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Orders"
       registerCells()
    }

    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}


extension ListOrdersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
