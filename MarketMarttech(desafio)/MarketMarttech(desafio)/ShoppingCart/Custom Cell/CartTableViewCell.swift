//
//  CartTableViewCell.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 17/03/21.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceCartLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var presentSubTitle: UILabel!
    @IBOutlet weak var subtotalPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func setupCell(withData: CartCell) {
        
        self.logoImage.image = UIImage(named: withData.image ?? "")
        self.titleLabel.text = withData.title
        self.priceCartLabel.text = withData.price
        self.quantityLabel.text = withData.quantity
        self.subtotalPriceLabel.text = withData.totalPrice
}
    @IBAction func plusAction(_ sender: Any) {
    }
    
    @IBAction func minusAction(_ sender: Any) {
    }
    
    
    
}
