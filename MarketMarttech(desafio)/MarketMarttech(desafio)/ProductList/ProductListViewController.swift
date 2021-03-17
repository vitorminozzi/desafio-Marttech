//
//  ProductListViewController.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 17/03/21.
//

import UIKit

class ProductListViewController: UIViewController {

    var viewModel = ProductListViewModel()
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        viewModel.getProductList()
        self.productTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
    }

    @IBAction func tappedGoToCart(_ sender: Any) {
        performSegue(withIdentifier: SegueType.toCart.rawValue, sender: nil)
    }
}

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProductTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as? ProductTableViewCell
        cell?.setupCell(withData: viewModel.getCellData(index: indexPath.row), delegate: self)
        return cell ?? UITableViewCell()
    }
}

extension ProductListViewController: ProductTableViewCellDelegate {
    func tappedButton() {
        print("Produto Adicionado")
    }
}

extension ProductListViewController: ProductListViewModelDelegate {
    func successGetProduct(success: Bool) {
        DispatchQueue.main.async {
            [weak self] in
            if success == true {
                self?.productTableView.reloadData()
            }
        }
    }
    }
    
        
    
    

