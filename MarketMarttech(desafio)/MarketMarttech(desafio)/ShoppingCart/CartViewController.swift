//
//  CartViewController.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 17/03/21.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var endShopButton: UIButton!
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var shopCartLabel: UILabel!
    @IBOutlet weak var shopImageLabel: UIImageView!
    @IBOutlet weak var backToProductButton: UIButton!
    @IBOutlet weak var itensLabel: UILabel!
    @IBOutlet weak var itensQuantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cartTableView.delegate = self
        self.cartTableView.dataSource = self
    }
    


    @IBAction func tappedGoToShop(_ sender: Any) {
    }
    
    @IBAction func tappedBackButton(_ sender: Any) {
    }
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
