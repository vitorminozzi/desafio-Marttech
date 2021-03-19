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

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceCartLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var subtotalPriceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    weak var delegate: CartCellDelegate?
    var count: Int?
    var index: Int?
    
    func setupCell(withData: CartCell, delegate:CartCellDelegate, indexPath: Int, count: Int) {
        
        self.count = count
        index = indexPath
        cellImage.image = UIImage(named: withData.image ?? "")
        titleLabel.text = withData.title
        priceCartLabel.text = withData.price
        quantityLabel.text = withData.quantity
        subtotalPriceLabel.text = withData.totalPrice
        descriptionLabel.text = withData.description
        self.delegate = delegate
}
    @IBAction func plusAction(_ sender: Any) {
        count = (count ?? 0) + 1
        quantityLabel.text = count?.description
        delegate?.tappedPlusButton(count: count ?? 0, index: index ?? 0)
    }
    
    @IBAction func minusAction(_ sender: Any) {
        if count != 0 {
            count = (count ?? 0) - 1
            quantityLabel.text = count?.description
            delegate?.tappedMinusButton(count: count ?? 0, index: index ?? 0)
        }
    }
    
    
    
}
