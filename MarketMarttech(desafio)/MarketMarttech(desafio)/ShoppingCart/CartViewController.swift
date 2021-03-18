//
//  CartViewController.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 17/03/21.
//

import UIKit

class CartViewController: UIViewController {


    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var shopCartLabel: UILabel!
    @IBOutlet weak var shopImageLabel: UIImageView!
    @IBOutlet weak var backToProductButton: UIButton!
    @IBOutlet weak var itensLabel: UILabel!
    @IBOutlet weak var itensQuantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var toTheProductButton: UIButton!
    @IBOutlet weak var toCheckoutButton: UIButton!
    var viewModel = CartViewModel()
    
    var recipeProducts:[Product] = []
    var recipeQuantity:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.cartProduct = recipeProducts
        viewModel.cartQuantity = recipeQuantity
        self.setupButton()
        self.cartTableView.delegate = self
        self.cartTableView.dataSource = self
        self.cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
    }
    
    func setupButton(){
        self.toTheProductButton.layer.borderColor = CGColor(red: 0/155, green: 0/155, blue: 0/155, alpha: 1.0)
        self.toTheProductButton.layer.borderWidth = 3
        self.toTheProductButton.layer.cornerRadius = 5
        self.toCheckoutButton.layer.borderColor = CGColor(red: 0/155, green: 0/155, blue: 0/155, alpha: 1.0)
        self.toCheckoutButton.layer.borderWidth = 3
        self.toCheckoutButton.layer.cornerRadius = 5
    }
    
    @IBAction func tappedGoToShop(_ sender: Any) {
    }
    
    @IBAction func backToProduct(_ sender: Any) {
    }
    
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cartProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CartTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") as? CartTableViewCell
        cell?.setupCell(withData: viewModel.getCartCellData(index: indexPath.row),
                        delegate: self,
                        indexPath: indexPath.row,
                        count:viewModel.getOriginalQuantity(index: indexPath.row))
        return cell ?? UITableViewCell()
    }
}

extension CartViewController: CartCellDelegate {
    
    func tappedPlusButton(count: Int, index: Int) {
        self.viewModel.cartQuantity.insert(count, at: index)
        self.viewModel.cartQuantity.remove(at: index + 1)
        self.itensQuantityLabel.text = String(viewModel.getReduceTotalQuantity())
        self.cartTableView.reloadData()
    }
    
    func tappedMinusButton(count: Int, index: Int) {
        self.viewModel.cartQuantity.insert(count, at: index)
        self.viewModel.cartQuantity.remove(at: index + 1)
        self.itensQuantityLabel.text = String(viewModel.getReduceTotalQuantity())
        self.cartTableView.reloadData()
    }
}
