//
//  OrderListViewController.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 18/03/21.
//

import UIKit

class OrderListViewController: UIViewController {

    @IBOutlet weak var orderListTitleLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var orderListTableView: UITableView!
    var viewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderListTableView.register(UINib(nibName: "OrderListTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderListTableViewCell")
        orderListTableView.delegate = self
        orderListTableView.dataSource = self
        viewModel.getOrders()
    }

}

extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell") as? OrderListTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(withData: viewModel.getOrdersCellData(index: indexPath.row) ?? OrderCellData())
        return cell
    }
    
    
}
