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
    @IBOutlet weak var toCheckoutButton: UIButton!
    var viewModel = CartViewModel()
    
    var recipeProducts:[Product] = []
    var recipeQuantity:[Int] = []
    var recipePrice:[Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.totalPrice = recipePrice
        viewModel.cartProduct = recipeProducts
        viewModel.cartQuantity = recipeQuantity
        self.totalPriceLabel.text = String("R$ \(viewModel.getTotalOrderPrice())")
        self.itensQuantityLabel.text = String(viewModel.getReduceTotalQuantity())
        
        self.setupButton()
        self.cartTableView.delegate = self
        self.cartTableView.dataSource = self
        self.cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
    }
    
    func setupButton(){
     
        self.toCheckoutButton.layer.borderColor = CGColor(red: 0/155, green: 0/155, blue: 0/155, alpha: 1.0)
        self.toCheckoutButton.layer.borderWidth = 3
        self.toCheckoutButton.layer.cornerRadius = 5
    }
    
    @IBAction func tappedGoToShop(_ sender: Any) {
        self.performSegue(withIdentifier: SegueType.toCheckout.rawValue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueType.toCheckout.rawValue {
            let checkout = segue.destination as? CheckoutViewController
            
            checkout?.recipeTotal = String("R$ \(viewModel.getTotalOrderPrice())")
            checkout?.recipeProducts = viewModel.cartProduct
            checkout?.recipeQuantity = viewModel.cartQuantity
        }
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
        self.viewModel.totalPrice?.insert(viewModel.getDoubleTotalPrice(index: index), at: index)
        self.viewModel.totalPrice?.remove(at: index + 1)
        self.itensQuantityLabel.text = String(viewModel.getReduceTotalQuantity())
        self.totalPriceLabel.text = String("R$ \(viewModel.getTotalOrderPrice())")
        self.cartTableView.reloadData()
        self.viewModel.delegate?.quantityArray(array: viewModel.cartQuantity)
        self.viewModel.delegate?.priceArray(arru: viewModel.totalPrice ?? [])
    }
    
    func tappedMinusButton(count: Int, index: Int) {
        self.viewModel.cartQuantity.insert(count, at: index)
        self.viewModel.cartQuantity.remove(at: index + 1)
        self.viewModel.totalPrice?.insert(viewModel.getDoubleTotalPrice(index: index), at: index)
        self.viewModel.totalPrice?.remove(at: index + 1)
        self.itensQuantityLabel.text = String(viewModel.getReduceTotalQuantity())
        self.totalPriceLabel.text = String("R$ \(viewModel.getTotalOrderPrice())")
        self.cartTableView.reloadData()
        self.viewModel.delegate?.quantityArray(array: viewModel.cartQuantity)
        self.viewModel.delegate?.priceArray(arru: viewModel.totalPrice ?? [])
    }
}
