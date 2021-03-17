//
//  ProductTableViewCell.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 17/03/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell(withData: CellData) {
        
        self.productTitle.text = withData.title
        self.productImage.image = UIImage(named: withData.image ?? "")
        self.descriptionTextView.text = withData.description
        self.priceLabel.text = withData.price
    }
    
    @IBAction func tappedAddCart(_ sender: Any) {
        print("Adicionado Item")
    }
    
}
