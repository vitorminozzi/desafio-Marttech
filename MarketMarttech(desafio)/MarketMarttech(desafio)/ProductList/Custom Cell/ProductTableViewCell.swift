//
//  ProductTableViewCell.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 17/03/21.
//

import UIKit

protocol ProductTableViewCellDelegate: class {

    func tappedButton(index: Int)
    func tappedPlusButton(count: Int)
    func tappedMinusButton(count: Int)
}

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    weak var delegate: ProductTableViewCellDelegate?
    var count = 0
    var index: Int?
    
    func setupCell(withData: CellData, delegate: ProductTableViewCellDelegate?, indexPath: Int?) {
        
        index = indexPath
        productTitle.text = withData.title
        productImage.image = UIImage(named: withData.image ?? "")
        descriptionTextView.text = withData.description
        priceLabel.text = withData.price
        self.delegate = delegate
    }
    
    @IBAction func tappedAddCart(_ sender: Any) {
        guard let index = index else { return }
        delegate?.tappedButton(index: index)
        count = 0
        countLabel.text = count.description
    }
    
    @IBAction func tapPlusAction(_ sender: Any) {
        
        self.count = self.count + 1
        self.countLabel.text = self.count.description
        self.delegate?.tappedPlusButton(count: self.count)
    }
    
    @IBAction func tapMinusAction(_ sender: Any) {
        
        if self.count != 0 {
            self.count = self.count - 1
            self.countLabel.text = self.count.description
            self.delegate?.tappedMinusButton(count: self.count)
        }
    }
    
}
