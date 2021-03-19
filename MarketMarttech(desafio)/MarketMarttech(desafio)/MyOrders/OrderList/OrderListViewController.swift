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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getOrders()
        DispatchQueue.main.async { [weak self] in
            self?.orderListTableView.reloadData()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        orderListTableView.register(UINib(nibName: "OrderListTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderListTableViewCell")
        orderListTableView.delegate = self
        orderListTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueType.toDetail.rawValue {
            let details = segue.destination as? OrderDetailViewController
            details?.recipeCpf = viewModel.getOrdersListCpf(index: viewModel.currentIndex)
            details?.recipeItems = viewModel.getOrderListItens(index: viewModel.currentIndex)
            details?.recipePrice = viewModel.getOrderListTotal(index: viewModel.currentIndex)
            details?.recipeName = viewModel.getOrdersListName(index: viewModel.currentIndex)
            details?.recipeProducts = viewModel.getProducts(index: viewModel.currentIndex)
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.currentIndex = indexPath.row
        self.performSegue(withIdentifier: SegueType.toDetail.rawValue, sender: nil)
    }
    
    
}
