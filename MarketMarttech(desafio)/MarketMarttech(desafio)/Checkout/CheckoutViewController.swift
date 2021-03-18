//
//  CheckoutViewController.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 18/03/21.
//

import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet weak var presentationLabel: UILabel!
    @IBOutlet weak var inputInfoLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var checkOutTableView: UITableView!
    @IBOutlet weak var itensTextLabel: UILabel!
    @IBOutlet weak var quantityItensLabel: UILabel!
    @IBOutlet weak var priceTextLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var checkoutButton: UIButton!
    var recipeProducts:[Product] = []
    var recipeQuantity:[Int] = []
    var recipeTotal: String = ""
    var viewModel = CheckoutViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.checkOutTableView.register(UINib(nibName: "CheckoutTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckoutTableViewCell")
        viewModel.orderTotal = recipeTotal
        viewModel.orderQuantity = recipeQuantity
        viewModel.orderProducts = recipeProducts
        checkOutTableView.delegate = self
        checkOutTableView.dataSource = self
        totalPriceLabel.text = viewModel.getTotalString()
        quantityItensLabel.text = viewModel.getQuantity()
    }
    
    @IBAction func tappedCheckoutButton(_ sender: Any) {
       
        viewModel.order.append(Orders(name: nameTextField.text,
                                      cpf: cpfTextField.text,
                                      itens: viewModel.getQuantity(),
                                      total: viewModel.getTotalString(),
                                      products: viewModel.orderProducts))
    }
}

extension CheckoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CheckoutTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "CheckoutTableViewCell") as? CheckoutTableViewCell
        cell?.setupCell(withData: viewModel.getCheckoutCellData(index: indexPath.row))
        return cell ?? UITableViewCell()
}

}
