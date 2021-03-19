//
//  CheckoutTableViewCell.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 18/03/21.
//

import UIKit

class CheckoutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoCheckoutImage: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var checkOutTitleLabel: UILabel!
    @IBOutlet weak var checkoutPriceLabel: UILabel!
    
    func setupCell(withData: CheckoutCellData?) {
        
        self.logoCheckoutImage.image = UIImage(named: withData?.image ?? "")
        self.quantityLabel.text = withData?.quantity
        self.checkOutTitleLabel.text = withData?.title
        self.checkoutPriceLabel.text = withData?.totalPrice
    }
}
