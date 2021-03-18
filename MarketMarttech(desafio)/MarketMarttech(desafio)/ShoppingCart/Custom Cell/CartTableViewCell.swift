//
//  CartTableViewCell.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 17/03/21.
//

import UIKit

protocol CartCellDelegate: class {

    func tappedPlusButton(count: Int, index: Int)
    func tappedMinusButton(count: Int, index: Int)
}

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceCartLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var presentSubTitle: UILabel!
    @IBOutlet weak var subtotalPriceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    weak var delegate: CartCellDelegate?
    var count: Int?
    var index: Int?
    
    func setupCell(withData: CartCell, delegate:CartCellDelegate, indexPath: Int, count: Int) {
        
        self.count = count
        self.index = indexPath
        self.logoImage.image = UIImage(named: withData.image ?? "")
        self.titleLabel.text = withData.title
        self.priceCartLabel.text = withData.price
        self.quantityLabel.text = withData.quantity
        self.subtotalPriceLabel.text = withData.totalPrice
        self.descriptionLabel.text = withData.description
        self.delegate = delegate
}
    @IBAction func plusAction(_ sender: Any) {
        self.count = (self.count ?? 0) + 1
        self.quantityLabel.text = self.count?.description
        self.delegate?.tappedPlusButton(count: self.count ?? 0, index: self.index ?? 0)
        print(count)
        print(index)
    }
    
    @IBAction func minusAction(_ sender: Any) {
        if self.count != 0 {
            self.count = (self.count ?? 0) - 1
            self.quantityLabel.text = self.count?.description
            self.delegate?.tappedMinusButton(count: self.count ?? 0, index: self.index ?? 0)
        }
    }
    
    
    
}
