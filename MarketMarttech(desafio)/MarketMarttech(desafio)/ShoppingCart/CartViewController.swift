//
//  CartViewController.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 17/03/21.
//

import UIKit

class CartViewController: UIViewController {
    
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var itensLabel: UILabel!
    @IBOutlet weak var itensQuantityLabel: UILabel!
    @IBOutlet weak var priceTextLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var toCheckoutButton: UIButton!
    var viewModel = CartViewModel()
    var recipeProducts:[Product] = []
    var recipeQuantity:[Int] = []
    var recipePrice:[Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    func prepareView() {
        viewModel.cartTotalPrice = recipePrice
        viewModel.cartProduct = recipeProducts
        viewModel.cartQuantity = recipeQuantity
        totalPriceLabel.text = String("R$ \(viewModel.getTotalPrice())")
        itensQuantityLabel.text = String(viewModel.getReduceTotalQuantity())
        setupButton()
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
    }
    
    func setupButton() {
        
        toCheckoutButton.layer.borderColor = CGColor(red: 0/155, green: 0/155, blue: 0/155, alpha: 1.0)
        toCheckoutButton.layer.borderWidth = 3
        toCheckoutButton.layer.cornerRadius = 5
    }
    
    @IBAction func tappedGoToShop(_ sender: Any) {
        performSegue(withIdentifier: SegueType.toCheckout.rawValue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueType.toCheckout.rawValue {
            let checkout = segue.destination as? CheckoutViewController
            
            checkout?.recipeTotal = String("R$ \(viewModel.getTotalPrice())")
            checkout?.recipeProducts = viewModel.cartProduct
            checkout?.recipeQuantity = viewModel.cartQuantity
        }
    }
    func showAlert(title: String, message: String, style: UIAlertController.Style = .alert, index: Int) {

        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let cancelButton:UIAlertAction = UIAlertAction(title: "Cancelar", style: .cancel) { action in
            self.dismiss(animated: true, completion: nil)
        }

        let okButton:UIAlertAction = UIAlertAction(title: "Ok", style: .default) { [weak self] action in

            self?.viewModel.cartProduct.remove(at: index)
            self?.viewModel.cartQuantity.remove(at: index)
            self?.viewModel.cartTotalPrice?.remove(at: index)
            self?.itensQuantityLabel.text = String(self?.viewModel.getReduceTotalQuantity() ?? 0)
            self?.viewModel.delegate?.quantityArray(array: self?.viewModel.cartQuantity ?? [])
            self?.viewModel.delegate?.priceArray(array: self?.viewModel.cartTotalPrice ?? [])
            self?.viewModel.delegate?.productArray(array: self?.viewModel.cartProduct ?? [])
            self?.cartTableView.reloadData()

        }
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cartQuantity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CartTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") as? CartTableViewCell
        cell?.setupCell(withData: viewModel.getCartCellData(index: indexPath.row),
                        delegate: self,
                        indexPath: indexPath.row,
                        count:viewModel.getOriginalQuantity(index: indexPath.row))
        return cell ?? UITableViewCell()
    }
//        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//            if editingStyle == UITableViewCell.EditingStyle.delete {
//
//                viewModel.cartProduct.remove(at: indexPath.row)
//                viewModel.cartQuantity.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .automatic)
//                self.cartTableView.reloadData()
//                print(viewModel.cartProduct)
//                print(viewModel.cartQuantity)
//                self.itensQuantityLabel.text = String(viewModel.getReduceTotalQuantity())
//                self.totalPriceLabel.text = String("R$ \(viewModel.getTotalPrice())")
//                self.viewModel.delegate?.quantityArray(array: viewModel.cartQuantity)
//                self.viewModel.delegate?.priceArray(array: viewModel.cartTotalPrice ?? [])
//
//
//            }
//        }

}

extension CartViewController: CartCellDelegate {
    
    func tappedPlusButton(count: Int, index: Int) {
     
        self.viewModel.cartQuantity.insert(count, at: index)
        self.viewModel.cartQuantity.remove(at: index + 1)
        self.viewModel.cartTotalPrice?.insert(viewModel.getDoubleTotalPrice(index: index), at: index)
        self.viewModel.cartTotalPrice?.remove(at: index + 1)
        self.itensQuantityLabel.text = String(viewModel.getReduceTotalQuantity())
        self.totalPriceLabel.text = String("R$ \(viewModel.getTotalPrice())")
        self.cartTableView.reloadData()
        self.viewModel.delegate?.quantityArray(array: viewModel.cartQuantity)
        self.viewModel.delegate?.priceArray(array: viewModel.cartTotalPrice ?? [])
    }
    
    func tappedMinusButton(count: Int, index: Int) {
        if count < 1 {
            
            showAlert(title: "Deletar", message: "Deseja excluir esse produto?", index: index)
        }

        self.viewModel.cartQuantity.insert(count, at: index)
        self.viewModel.cartQuantity.remove(at: index + 1)
        self.viewModel.cartTotalPrice?.insert(viewModel.getDoubleTotalPrice(index: index), at: index)
        self.viewModel.cartTotalPrice?.remove(at: index + 1)
        self.itensQuantityLabel.text = String(viewModel.getReduceTotalQuantity())
        self.totalPriceLabel.text = String("R$ \(viewModel.getTotalPrice())")
        self.cartTableView.reloadData()
        self.viewModel.delegate?.quantityArray(array: viewModel.cartQuantity)
        self.viewModel.delegate?.priceArray(array: viewModel.cartTotalPrice ?? [])
    }
}
