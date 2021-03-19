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
        prepareView()
    }
    
    func prepareView() {
        viewModel.delegate = self
        viewModel.getProductList()
        productTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        productTableView.delegate = self
        productTableView.dataSource = self
    }
    
    
    @IBAction func tappedGoToCart(_ sender: Any) {
        performSegue(withIdentifier: SegueType.toCart.rawValue, sender: nil)
    }
    
    func showAlert(title: String, message: String, style: UIAlertController.Style = .alert) {
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let cancelButton:UIAlertAction = UIAlertAction(title: "Cancelar", style: .cancel) { action in
            self.dismiss(animated: true, completion: nil)
        }
        
        let okButton:UIAlertAction = UIAlertAction(title: "Ok", style: .default) { action in
            
            self.viewModel.selectedProducts.append(Product(id: self.viewModel.getId(index: self.viewModel.currentIndex),
                                                           title: self.viewModel.getProductTitle(index: self.viewModel.currentIndex),
                                                           price: self.viewModel.getOriginalPrice(index: self.viewModel.currentIndex),
                                                           description: self.viewModel.getDescription(index: self.viewModel.currentIndex),
                                                           imageString: self.viewModel.getImageString(index: self.viewModel.currentIndex)))
            self.viewModel.selectedQuantity.append(self.viewModel.modelCount)
            self.viewModel.selectedPrice.append(self.viewModel.getSelectedTotalPrice(index: self.viewModel.currentIndex))
        }
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueType.toCart.rawValue {
            let cart = segue.destination as? CartViewController
            
            cart?.viewModel.delegate = self
            cart?.recipePrice.append(contentsOf: viewModel.selectedPrice)
            cart?.recipeProducts.append(contentsOf: viewModel.selectedProducts)
            cart?.recipeQuantity.append(contentsOf: viewModel.selectedQuantity)
        }
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
        viewModel.currentIndex = index
        print(viewModel.currentIndex)
        showAlert(title: "Adicionar Produto", message: "Deseja adicionar \(self.viewModel.modelCount) produtos ao carrinho?")
    }
    
    func tappedPlusButton(count: Int) {
        print("Plus")
        viewModel.modelCount = count
    }
    
    func tappedMinusButton(count: Int) {
        print("Minus")
        viewModel.modelCount = count
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

extension ProductListViewController: CartViewModelDelegate {
    func productArray(array: [Product]) {
        viewModel.selectedProducts = array
    }
    
    func priceArray(array: [Double]) {
        viewModel.selectedPrice = array
    }
    
    func quantityArray(array: [Int]) {
        viewModel.selectedQuantity = array
    }
}



