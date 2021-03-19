//
//  DetailsTableViewCell.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 18/03/21.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var detailsCellImage: UIImageView!
    @IBOutlet weak var detailsCellTitle: UILabel!
    @IBOutlet weak var detailsPriceTitle: UILabel!
    @IBOutlet weak var detailsItensTitle: UILabel!
    @IBOutlet weak var textSubtotalLabel: UILabel!
    @IBOutlet weak var totalPricelLabel: UILabel!
    
    func setupCell(withData: DetailsCellData) {
        
        detailsCellImage.image = UIImage(named: withData.image ?? "")
        detailsCellTitle.text = withData.title
        detailsPriceTitle.text = withData.price
        totalPricelLabel.text = withData.subTotalPrice
        detailsItensTitle.text = withData.quantity
    }
}
