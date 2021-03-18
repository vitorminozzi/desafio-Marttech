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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cart = segue.destination as? CartViewController
        cart?.viewModel.cartProducts?.append((Product(id: viewModel.getId(index: viewModel.currentIndex),
                                             title: viewModel.getProductTitle(index: viewModel.currentIndex),
                                             price: viewModel.getOriginalPrice(index: viewModel.currentIndex) ,
                                             description: viewModel.getDescription(index: viewModel.currentIndex))))
        cart?.viewModel.numberOfProducts?.append(viewModel.modelCount)
        
    }
    
    }
    
extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as? ProductTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(withData: viewModel.getCellData(index: indexPath.row), delegate: self, indexPath: indexPath.row)
        return cell
    }
}

extension ProductListViewController: ProductTableViewCellDelegate {
    func tappedButton(index: Int) {
        self.viewModel.currentIndex = index
        performSegue(withIdentifier: SegueType.toCart.rawValue, sender: nil)
    }
    
    func tappedPlusButton(count: Int) {
        print("Plus")
        self.viewModel.modelCount = count
    }
    
    func tappedMinusButton(count: Int) {
        print("Minus")
        self.viewModel.modelCount = count
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
    
        
    
    

